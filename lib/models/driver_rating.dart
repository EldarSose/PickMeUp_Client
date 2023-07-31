// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DriverRating {
  int? driverRatingId;
  int? driverId;
  int? userId;
  double? rating;
  String? comment;
  bool? isDeleted;
  DriverRating({
    this.driverRatingId,
    this.driverId,
    this.userId,
    this.rating,
    this.comment,
    this.isDeleted,
  });

  DriverRating copyWith({
    int? driverRatingId,
    int? driverId,
    int? userId,
    double? rating,
    String? comment,
    bool? isDeleted,
  }) {
    return DriverRating(
      driverRatingId: driverRatingId ?? this.driverRatingId,
      driverId: driverId ?? this.driverId,
      userId: userId ?? this.userId,
      rating: rating ?? this.rating,
      comment: comment ?? this.comment,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'driverRatingId': driverRatingId,
      'driverId': driverId,
      'userId': userId,
      'rating': rating,
      'comment': comment,
      'isDeleted': isDeleted,
    };
  }

  factory DriverRating.fromMap(Map<String, dynamic> map) {
    return DriverRating(
      driverRatingId:
          map['driverRatingId'] != null ? map['driverRatingId'] as int : null,
      driverId: map['driverId'] != null ? map['driverId'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      rating: map['rating'] != null ? map['rating'] as double : null,
      comment: map['comment'] != null ? map['comment'] as String : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverRating.fromJson(String source) =>
      DriverRating.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DriverRating(driverRatingId: $driverRatingId, driverId: $driverId, userId: $userId, rating: $rating, comment: $comment, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant DriverRating other) {
    if (identical(this, other)) return true;

    return other.driverRatingId == driverRatingId &&
        other.driverId == driverId &&
        other.userId == userId &&
        other.rating == rating &&
        other.comment == comment &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return driverRatingId.hashCode ^
        driverId.hashCode ^
        userId.hashCode ^
        rating.hashCode ^
        comment.hashCode ^
        isDeleted.hashCode;
  }
}
