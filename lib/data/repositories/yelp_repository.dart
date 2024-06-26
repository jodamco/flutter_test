import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:restaurantour/data/models/restaurant.dart';

const _apiKey = '<PUT YOUR API KEY HERE>';

class MockResponse {
  final Map<String, dynamic> data;
  MockResponse(this.data);
}

class YelpRepository {
  late Dio dio;

  YelpRepository({
    @visibleForTesting Dio? dio,
  }) : dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: 'https://api.yelp.com',
                headers: {
                  'Authorization': 'Bearer $_apiKey',
                  'Content-Type': 'application/graphql',
                },
              ),
            );

  Future<RestaurantQueryResult?> getRestaurants({int offset = 0}) async {
    try {
      final response;

      if (kReleaseMode) {
        response = await dio.post<Map<String, dynamic>>(
          '/v3/graphql',
          data: _getQuery(offset),
        );
      } else {
        response = await mockRestaurantsResponse();
      }

      return RestaurantQueryResult.fromJson(response.data!['data']['search']);
    } on DioException catch (error) {
      debugPrint(error.message);
      rethrow;
    }
  }

  Future<MockResponse> mockRestaurantsResponse() async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonString =
        await rootBundle.loadString('assets/yelp_restaurants_response.json');
    return MockResponse(jsonDecode(jsonString));
  }

  Future<ReviewQueryResult?> getRestaurantReviews({
    required String restaurantId,
    int offset = 0,
  }) async {
    try {
      final response;

      if (kReleaseMode) {
        response = await dio.post<Map<String, dynamic>>(
          '/v3/graphql',
          data: _getReviewsQuery(restaurantId, offset),
        );
      } else {
        response = await mockRestaurantReviewsResponse();
      }

      return ReviewQueryResult.fromJson(response.data!['data']['business']);
    } on DioException catch (error) {
      debugPrint(error.message);
      rethrow;
    }
  }

  Future<MockResponse> mockRestaurantReviewsResponse() async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonString =
        await rootBundle.loadString('assets/yelp_reviews_response.json');
    return MockResponse(jsonDecode(jsonString));
  }

  Future<StatusQueryResult?> getRestaurantStatus(String restaurantId) async {
    try {
      final response;

      if (kReleaseMode) {
        response = await dio.post<Map<String, dynamic>>(
          '/v3/graphql',
          data: _getRestaurantStatusQuery(restaurantId),
        );
      } else {
        response = await mockRestaurantStatusResponse(restaurantId);
      }

      return StatusQueryResult.fromJson(response.data!['data']['business']);
    } on DioException catch (error) {
      debugPrint(error.message);
      rethrow;
    }
  }

  Future<MockResponse> mockRestaurantStatusResponse(String restaurantId) async {
    await Future.delayed(const Duration(seconds: 2));
    final jsonString =
        await rootBundle.loadString('assets/yelp_rest_status_response.json');

    var mock = MockResponse(jsonDecode(jsonString));
    mock.data['data']['business']['id'] = restaurantId;
    return mock;
  }

  String _getQuery(int offset) {
    return '''
query getRestaurants {
  search(location: "Las Vegas", limit: 20, offset: $offset) {
    total    
    business {
      id
      name
      price
      rating
      photos
      reviews {
        id
        rating
        user {
          id
          image_url
          name
        }
      }
      categories {
        title
        alias
      }
      hours {
        is_open_now
      }
      location {
        formatted_address
      }
    }
  }
  }
''';
  }

  String _getReviewsQuery(String restaurantId, int offset) {
    return '''
query getRestaurantReviews {
  business(id: "$restaurantId") {
    review_count
    reviews(limit: 20, offset: $offset) {
      id
      rating
      user {
        id
        image_url
        name
      }
      text
    }
    id
    name
  }
}
''';
  }

  String _getRestaurantStatusQuery(String restaurantId) {
    return '''
query getRestaurantStatus {
  business(id: "$restaurantId") {
    id
    hours {
      is_open_now
    }
  }
}
''';
  }
}
