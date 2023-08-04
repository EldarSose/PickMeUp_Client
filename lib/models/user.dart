// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int? userId;
  String? firstName;
  String? lastName;
  int? userAccountId;
  DateTime? dateOfBirth;
  int? genderId;
  String? phoneNumber;
  int? taxiCompanyId;
  bool? isDeleted;
  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.userAccountId,
    this.dateOfBirth,
    this.genderId,
    this.phoneNumber,
    this.taxiCompanyId,
    this.isDeleted,
  });

  User copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    int? userAccountId,
    DateTime? dateOfBirth,
    int? genderId,
    String? phoneNumber,
    int? taxiCompanyId,
    bool? isDeleted,
  }) {
    return User(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      userAccountId: userAccountId ?? this.userAccountId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      genderId: genderId ?? this.genderId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      taxiCompanyId: taxiCompanyId ?? this.taxiCompanyId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'userAccountId': userAccountId,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch,
      'genderId': genderId,
      'phoneNumber': phoneNumber,
      'taxiCompanyId': taxiCompanyId,
      'isDeleted': isDeleted,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] != null ? map['userId'] as int : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      userAccountId:
          map['userAccountId'] != null ? map['userAccountId'] as int : null,
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.parse(map['dateOfBirth'])
          : null,
      genderId: map['genderId'] != null ? map['genderId'] as int : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      taxiCompanyId:
          map['taxiCompanyId'] != null ? map['taxiCompanyId'] as int : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(userId: $userId, firstName: $firstName, lastName: $lastName, userAccountId: $userAccountId, dateOfBirth: $dateOfBirth, genderId: $genderId, phoneNumber: $phoneNumber, taxiCompanyId: $taxiCompanyId, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.userAccountId == userAccountId &&
        other.dateOfBirth == dateOfBirth &&
        other.genderId == genderId &&
        other.phoneNumber == phoneNumber &&
        other.taxiCompanyId == taxiCompanyId &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        userAccountId.hashCode ^
        dateOfBirth.hashCode ^
        genderId.hashCode ^
        phoneNumber.hashCode ^
        taxiCompanyId.hashCode ^
        isDeleted.hashCode;
  }
}
