// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Roles {
  int? roleId;
  String? roleName;
  String? roleDescription;
  bool? isDeleted;
  Roles({
    this.roleId,
    this.roleName,
    this.roleDescription,
    this.isDeleted,
  });

  Roles copyWith({
    int? roleId,
    String? roleName,
    String? roleDescription,
    bool? isDeleted,
  }) {
    return Roles(
      roleId: roleId ?? this.roleId,
      roleName: roleName ?? this.roleName,
      roleDescription: roleDescription ?? this.roleDescription,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'roleId': roleId,
      'roleName': roleName,
      'roleDescription': roleDescription,
      'isDeleted': isDeleted,
    };
  }

  factory Roles.fromMap(Map<String, dynamic> map) {
    return Roles(
      roleId: map['roleId'] != null ? map['roleId'] as int : null,
      roleName: map['roleName'] != null ? map['roleName'] as String : null,
      roleDescription: map['roleDescription'] != null
          ? map['roleDescription'] as String
          : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Roles.fromJson(String source) =>
      Roles.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Roles(roleId: $roleId, roleName: $roleName, roleDescription: $roleDescription, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant Roles other) {
    if (identical(this, other)) return true;

    return other.roleId == roleId &&
        other.roleName == roleName &&
        other.roleDescription == roleDescription &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return roleId.hashCode ^
        roleName.hashCode ^
        roleDescription.hashCode ^
        isDeleted.hashCode;
  }
}
