// Mocks generated by Mockito 5.4.4 from annotations
// in restaurantour/test/logic/restaurants_bloc/restaurants_bloc.test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dio/dio.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:restaurantour/data/models/restaurant.dart' as _i5;
import 'package:restaurantour/data/repositories/yelp_repository.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDio_0 extends _i1.SmartFake implements _i2.Dio {
  _FakeDio_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMockResponse_1 extends _i1.SmartFake implements _i3.MockResponse {
  _FakeMockResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [YelpRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockYelpRepository extends _i1.Mock implements _i3.YelpRepository {
  MockYelpRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Dio get dio => (super.noSuchMethod(
        Invocation.getter(#dio),
        returnValue: _FakeDio_0(
          this,
          Invocation.getter(#dio),
        ),
      ) as _i2.Dio);

  @override
  set dio(_i2.Dio? _dio) => super.noSuchMethod(
        Invocation.setter(
          #dio,
          _dio,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.Future<_i5.RestaurantQueryResult?> getRestaurants({int? offset = 0}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRestaurants,
          [],
          {#offset: offset},
        ),
        returnValue: _i4.Future<_i5.RestaurantQueryResult?>.value(),
      ) as _i4.Future<_i5.RestaurantQueryResult?>);

  @override
  _i4.Future<_i3.MockResponse> mockRestaurantsResponse() => (super.noSuchMethod(
        Invocation.method(
          #mockRestaurantsResponse,
          [],
        ),
        returnValue: _i4.Future<_i3.MockResponse>.value(_FakeMockResponse_1(
          this,
          Invocation.method(
            #mockRestaurantsResponse,
            [],
          ),
        )),
      ) as _i4.Future<_i3.MockResponse>);

  @override
  _i4.Future<_i5.ReviewQueryResult?> getRestaurantReviews({
    required String? restaurantId,
    int? offset = 0,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRestaurantReviews,
          [],
          {
            #restaurantId: restaurantId,
            #offset: offset,
          },
        ),
        returnValue: _i4.Future<_i5.ReviewQueryResult?>.value(),
      ) as _i4.Future<_i5.ReviewQueryResult?>);

  @override
  _i4.Future<_i3.MockResponse> mockRestaurantReviewsResponse() =>
      (super.noSuchMethod(
        Invocation.method(
          #mockRestaurantReviewsResponse,
          [],
        ),
        returnValue: _i4.Future<_i3.MockResponse>.value(_FakeMockResponse_1(
          this,
          Invocation.method(
            #mockRestaurantReviewsResponse,
            [],
          ),
        )),
      ) as _i4.Future<_i3.MockResponse>);

  @override
  _i4.Future<_i5.StatusQueryResult?> getRestaurantStatus(
          String? restaurantId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRestaurantStatus,
          [restaurantId],
        ),
        returnValue: _i4.Future<_i5.StatusQueryResult?>.value(),
      ) as _i4.Future<_i5.StatusQueryResult?>);

  @override
  _i4.Future<_i3.MockResponse> mockRestaurantStatusResponse(
          String? restaurantId) =>
      (super.noSuchMethod(
        Invocation.method(
          #mockRestaurantStatusResponse,
          [restaurantId],
        ),
        returnValue: _i4.Future<_i3.MockResponse>.value(_FakeMockResponse_1(
          this,
          Invocation.method(
            #mockRestaurantStatusResponse,
            [restaurantId],
          ),
        )),
      ) as _i4.Future<_i3.MockResponse>);
}
