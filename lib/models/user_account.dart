// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserAccount {
  int? userAccountId;
  String? email;
  bool? isDeleted;
  UserAccount({
    this.userAccountId,
    this.email,
    this.isDeleted,
  });

  UserAccount copyWith({
    int? userAccountId,
    String? email,
    bool? isDeleted,
  }) {
    return UserAccount(
      userAccountId: userAccountId ?? this.userAccountId,
      email: email ?? this.email,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userAccountId': userAccountId,
      'email': email,
      'isDeleted': isDeleted,
    };
  }

  factory UserAccount.fromMap(Map<String, dynamic> map) {
    return UserAccount(
      userAccountId:
          map['userAccountId'] != null ? map['userAccountId'] as int : null,
      email: map['email'] != null ? map['email'] as String : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserAccount.fromJson(String source) =>
      UserAccount.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserAccount(userAccountId: $userAccountId, email: $email, isDeleted: $isDeleted)';

  @override
  bool operator ==(covariant UserAccount other) {
    if (identical(this, other)) return true;

    return other.userAccountId == userAccountId &&
        other.email == email &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode =>
      userAccountId.hashCode ^ email.hashCode ^ isDeleted.hashCode;
}
