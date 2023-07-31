// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RoleUser {
  int? userId;
  int? roleId;
  bool? isDeleted;
  RoleUser({
    this.userId,
    this.roleId,
    this.isDeleted,
  });

  RoleUser copyWith({
    int? userId,
    int? roleId,
    bool? isDeleted,
  }) {
    return RoleUser(
      userId: userId ?? this.userId,
      roleId: roleId ?? this.roleId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'roleId': roleId,
      'isDeleted': isDeleted,
    };
  }

  factory RoleUser.fromMap(Map<String, dynamic> map) {
    return RoleUser(
      userId: map['userId'] != null ? map['userId'] as int : null,
      roleId: map['roleId'] != null ? map['roleId'] as int : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RoleUser.fromJson(String source) =>
      RoleUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'RoleUser(userId: $userId, roleId: $roleId, isDeleted: $isDeleted)';

  @override
  bool operator ==(covariant RoleUser other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.roleId == roleId &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode => userId.hashCode ^ roleId.hashCode ^ isDeleted.hashCode;
}
