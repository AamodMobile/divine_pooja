

class ProductRatingModel {
  dynamic averageRating;
  int? totalRatings;
  RatingCounts? ratingCounts;

  ProductRatingModel({
    this.averageRating,
    this.totalRatings,
    this.ratingCounts,
  });

  factory ProductRatingModel.fromJson(Map<String, dynamic> json) => ProductRatingModel(
    averageRating: json["average_rating"],
    totalRatings: json["total_ratings"],
    ratingCounts: json["rating_counts"] == null ? null : RatingCounts.fromJson(json["rating_counts"]),
  );

  Map<String, dynamic> toJson() => {
    "average_rating": averageRating,
    "total_ratings": totalRatings,
    "rating_counts": ratingCounts?.toJson(),
  };
}

class RatingCounts {
  dynamic average1;
  dynamic average2;
  dynamic average3;
  dynamic average4;
  dynamic average5;

  RatingCounts({
    this.average1,
    this.average2,
    this.average3,
    this.average4,
    this.average5,
  });

  factory RatingCounts.fromJson(Map<String, dynamic> json) => RatingCounts(
    average1: json["average_1"],
    average2: json["average_2"],
    average3: json["average_3"],
    average4: json["average_4"],
    average5: json["average_5"],
  );

  Map<String, dynamic> toJson() => {
    "average_1": average1,
    "average_2": average2,
    "average_3": average3,
    "average_4": average4,
    "average_5": average5,
  };
}