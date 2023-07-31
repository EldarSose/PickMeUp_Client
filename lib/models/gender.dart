// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Gender {
  int? genderId;
  String? description;
  bool? isDeleted;
  Gender({
    this.genderId,
    this.description,
    this.isDeleted,
  });

  Gender copyWith({
    int? genderId,
    String? description,
    bool? isDeleted,
  }) {
    return Gender(
      genderId: genderId ?? this.genderId,
      description: description ?? this.description,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'genderId': genderId,
      'description': description,
      'isDeleted': isDeleted,
    };
  }

  factory Gender.fromMap(Map<String, dynamic> map) {
    return Gender(
      genderId: map['genderId'] != null ? map['genderId'] as int : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Gender.fromJson(String source) =>
      Gender.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Gender(genderId: $genderId, description: $description, isDeleted: $isDeleted)';

  @override
  bool operator ==(covariant Gender other) {
    if (identical(this, other)) return true;

    return other.genderId == genderId &&
        other.description == description &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode =>
      genderId.hashCode ^ description.hashCode ^ isDeleted.hashCode;
}
