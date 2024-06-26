import 'package:json_annotation/json_annotation.dart';

part 'restaurant.g.dart';

@JsonSerializable()
class Category {
  final String? alias;
  final String? title;

  Category({
    this.alias,
    this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Hours {
  @JsonKey(name: 'is_open_now')
  final bool? isOpenNow;

  const Hours({
    this.isOpenNow,
  });

  factory Hours.fromJson(Map<String, dynamic> json) => _$HoursFromJson(json);

  Map<String, dynamic> toJson() => _$HoursToJson(this);
}

@JsonSerializable()
class User {
  final String? id;
  @JsonKey(name: 'image_url')
  final String? imageUrl;
  final String? name;

  const User({
    this.id,
    this.imageUrl,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Review {
  final String? id;
  final int? rating;
  final User? user;
  final String? text;

  const Review({
    this.id,
    this.rating,
    this.user,
    this.text,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}

@JsonSerializable()
class Location {
  @JsonKey(name: 'formatted_address')
  final String? formattedAddress;

  Location({
    this.formattedAddress,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Restaurant {
  final String? id;
  final String? name;
  final String? price;
  final double? rating;
  final List<String>? photos;
  final List<Category>? categories;
  final List<Hours>? hours;
  final List<Review>? reviews;
  final Location? location;

  const Restaurant({
    this.id,
    this.name,
    this.price,
    this.rating,
    this.photos,
    this.categories,
    this.hours,
    this.reviews,
    this.location,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantToJson(this);

  /// Use the first category for the category shown to the user
  String get displayCategory {
    if (categories != null && categories!.isNotEmpty) {
      return categories!.first.title ?? '';
    }
    return '';
  }

  /// Use the first image as the image shown to the user
  String get heroImage {
    if (photos != null && photos!.isNotEmpty) {
      return photos!.first;
    }
    return '';
  }

  /// This logic is probably not correct in all cases but it is ok
  /// for this application
  bool get isOpen {
    if (hours != null && hours!.isNotEmpty) {
      return hours!.first.isOpenNow ?? false;
    }
    return false;
  }

  Restaurant copyWith({
    String? id,
    String? name,
    String? price,
    double? rating,
    List<String>? photos,
    List<Category>? categories,
    List<Hours>? hours,
    List<Review>? reviews,
    Location? location,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      photos: photos ?? this.photos,
      categories: categories ?? this.categories,
      hours: hours ?? this.hours,
      reviews: reviews ?? this.reviews,
      location: location ?? this.location,
    );
  }
}

@JsonSerializable()
class RestaurantQueryResult {
  final int? total;
  @JsonKey(name: 'business')
  final List<Restaurant>? restaurants;

  const RestaurantQueryResult({
    this.total,
    this.restaurants,
  });

  factory RestaurantQueryResult.fromJson(Map<String, dynamic> json) =>
      _$RestaurantQueryResultFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantQueryResultToJson(this);
}

@JsonSerializable()
class ReviewQueryResult {
  @JsonKey(name: 'review_count')
  final int? total;
  @JsonKey(name: 'reviews')
  final List<Review>? reviewsList;

  const ReviewQueryResult({
    this.total,
    this.reviewsList,
  });

  factory ReviewQueryResult.fromJson(Map<String, dynamic> json) =>
      _$ReviewQueryResultFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewQueryResultToJson(this);
}

@JsonSerializable()
class StatusQueryResult {
  final String? id;
  final List<Hours>? hours;

  const StatusQueryResult({
    this.id,
    this.hours,
  });

  factory StatusQueryResult.fromJson(Map<String, dynamic> json) =>
      _$StatusQueryResultFromJson(json);

  Map<String, dynamic> toJson() => _$StatusQueryResultToJson(this);
}
