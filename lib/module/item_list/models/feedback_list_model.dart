class FeedBackListModel {
  int? id;
  String? userName;
  String? rating;
  String? feedback;
  DateTime? createdAt;
  String? userProfile;
  List<FeedbackImage>? feedbackImages;

  FeedBackListModel({
    this.id,
    this.userName,
    this.rating,
    this.feedback,
    this.createdAt,
    this.userProfile,
    this.feedbackImages,
  });

  factory FeedBackListModel.fromJson(Map<String, dynamic> json) => FeedBackListModel(
    id: json["id"],
    userName: json["user_name"],
    rating: json["rating"],
    feedback: json["feedback"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    userProfile: json["user_profile"]??"",
    feedbackImages: json["feedback_images"] == null ? [] : List<FeedbackImage>.from(json["feedback_images"]!.map((x) => FeedbackImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_name": userName,
    "rating": rating,
    "feedback": feedback,
    "created_at": createdAt?.toIso8601String(),
    "user_profile": userProfile,
    "feedback_images": feedbackImages == null ? [] : List<dynamic>.from(feedbackImages!.map((x) => x.toJson())),
  };
}

class FeedbackImage {
  int? id;
  dynamic feedbackId;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  FeedbackImage({
    this.id,
    this.feedbackId,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  factory FeedbackImage.fromJson(Map<String, dynamic> json) => FeedbackImage(
    id: json["id"],
    feedbackId: json["feedback_id"],
    image: json["image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "feedback_id": feedbackId,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
