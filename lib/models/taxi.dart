// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Taxi {
  int? taxiId;
  String? taxiName;
  int? userId;
  num? startingPrice;
  num? pricePerKilometer;
  String? address;
  bool? isDeleted;
  Taxi({
    this.taxiId,
    this.taxiName,
    this.userId,
    this.startingPrice,
    this.pricePerKilometer,
    this.address,
    this.isDeleted,
  });

  Taxi copyWith({
    int? taxiId,
    String? taxiName,
    int? userId,
    double? startingPrice,
    double? pricePerKilometer,
    String? address,
    bool? isDeleted,
  }) {
    return Taxi(
      taxiId: taxiId ?? this.taxiId,
      taxiName: taxiName ?? this.taxiName,
      userId: userId ?? this.userId,
      startingPrice: startingPrice ?? this.startingPrice,
      pricePerKilometer: pricePerKilometer ?? this.pricePerKilometer,
      address: address ?? this.address,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'taxiId': taxiId,
      'taxiName': taxiName,
      'userId': userId,
      'startingPrice': startingPrice,
      'pricePerKilometer': pricePerKilometer,
      'address': address,
      'isDeleted': isDeleted,
    };
  }

  factory Taxi.fromMap(Map<String, dynamic> map) {
    return Taxi(
      taxiId: map['taxiId'] != null ? map['taxiId'] as int : null,
      taxiName: map['taxiName'] != null ? map['taxiName'] as String : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      startingPrice:
          map['startingPrice'] != null ? map['startingPrice'] as num : null,
      pricePerKilometer: map['pricePerKilometer'] != null
          ? map['pricePerKilometer'] as num
          : null,
      address: map['address'] != null ? map['address'] as String : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Taxi.fromJson(String source) =>
      Taxi.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Taxi(taxiId: $taxiId, taxiName: $taxiName, userId: $userId, startingPrice: $startingPrice, pricePerKilometer: $pricePerKilometer, address: $address, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant Taxi other) {
    if (identical(this, other)) return true;

    return other.taxiId == taxiId &&
        other.taxiName == taxiName &&
        other.userId == userId &&
        other.startingPrice == startingPrice &&
        other.pricePerKilometer == pricePerKilometer &&
        other.address == address &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return taxiId.hashCode ^
        taxiName.hashCode ^
        userId.hashCode ^
        startingPrice.hashCode ^
        pricePerKilometer.hashCode ^
        address.hashCode ^
        isDeleted.hashCode;
  }
}
