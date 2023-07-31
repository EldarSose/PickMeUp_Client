// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaxiContact {
  int? taxiId;
  int? contactId;
  bool? isDeleted;
  TaxiContact({
    this.taxiId,
    this.contactId,
    this.isDeleted,
  });

  TaxiContact copyWith({
    int? taxiId,
    int? contactId,
    bool? isDeleted,
  }) {
    return TaxiContact(
      taxiId: taxiId ?? this.taxiId,
      contactId: contactId ?? this.contactId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taxiId': taxiId,
      'contactId': contactId,
      'isDeleted': isDeleted,
    };
  }

  factory TaxiContact.fromMap(Map<String, dynamic> map) {
    return TaxiContact(
      taxiId: map['taxiId'] != null ? map['taxiId'] as int : null,
      contactId: map['contactId'] != null ? map['contactId'] as int : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaxiContact.fromJson(String source) =>
      TaxiContact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TaxiContact(taxiId: $taxiId, contactId: $contactId, isDeleted: $isDeleted)';

  @override
  bool operator ==(covariant TaxiContact other) {
    if (identical(this, other)) return true;

    return other.taxiId == taxiId &&
        other.contactId == contactId &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode => taxiId.hashCode ^ contactId.hashCode ^ isDeleted.hashCode;
}
