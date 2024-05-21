// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Reviews {
  int? reviewId;
  int? taxiId;
  int? userId;
  String? comment;
  num? rating;
  bool? isDeleted;
  Reviews({
    this.reviewId,
    this.taxiId,
    this.userId,
    this.comment,
    this.rating,
    this.isDeleted,
  });

  Reviews copyWith({
    int? reviewId,
    int? taxiId,
    int? userId,
    String? comment,
    double? rating,
    bool? isDeleted,
  }) {
    return Reviews(
      reviewId: reviewId ?? this.reviewId,
      taxiId: taxiId ?? this.taxiId,
      userId: userId ?? this.userId,
      comment: comment ?? this.comment,
      rating: rating ?? this.rating,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reviewId': reviewId,
      'taxiId': taxiId,
      'userId': userId,
      'comment': comment,
      'rating': rating,
      'isDeleted': isDeleted,
    };
  }

  factory Reviews.fromMap(Map<String, dynamic> map) {
    return Reviews(
      reviewId: map['reviewId'] != null ? map['reviewId'] as int : null,
      taxiId: map['taxiId'] != null ? map['taxiId'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
      rating: map['rating'] != null ? map['rating'] as num : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Reviews.fromJson(String source) =>
      Reviews.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Reviews(reviewId: $reviewId, taxiId: $taxiId, userId: $userId, comment: $comment, rating: $rating, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant Reviews other) {
    if (identical(this, other)) return true;

    return other.reviewId == reviewId &&
        other.taxiId == taxiId &&
        other.userId == userId &&
        other.comment == comment &&
        other.rating == rating &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return reviewId.hashCode ^
        taxiId.hashCode ^
        userId.hashCode ^
        comment.hashCode ^
        rating.hashCode ^
        isDeleted.hashCode;
  }
}
