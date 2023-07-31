// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contact {
  int? contactId;
  String? contactName;
  String? contactInfo;
  bool? isDeleted;
  Contact({
    this.contactId,
    this.contactName,
    this.contactInfo,
    this.isDeleted,
  });

  Contact copyWith({
    int? contactId,
    String? contactName,
    String? contactInfo,
    bool? isDeleted,
  }) {
    return Contact(
      contactId: contactId ?? this.contactId,
      contactName: contactName ?? this.contactName,
      contactInfo: contactInfo ?? this.contactInfo,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'contactId': contactId,
      'contactName': contactName,
      'contactInfo': contactInfo,
      'isDeleted': isDeleted,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      contactId: map['contactId'] != null ? map['contactId'] as int : null,
      contactName:
          map['contactName'] != null ? map['contactName'] as String : null,
      contactInfo:
          map['contactInfo'] != null ? map['contactInfo'] as String : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Contact(contactId: $contactId, contactName: $contactName, contactInfo: $contactInfo, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;

    return other.contactId == contactId &&
        other.contactName == contactName &&
        other.contactInfo == contactInfo &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return contactId.hashCode ^
        contactName.hashCode ^
        contactInfo.hashCode ^
        isDeleted.hashCode;
  }
}
