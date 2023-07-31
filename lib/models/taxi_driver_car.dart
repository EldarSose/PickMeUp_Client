// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaxiDriverCar {
  int? carId;
  int? taxiDriverId;
  bool? isDeleted;
  TaxiDriverCar({
    this.carId,
    this.taxiDriverId,
    this.isDeleted,
  });

  TaxiDriverCar copyWith({
    int? carId,
    int? taxiDriverId,
    bool? isDeleted,
  }) {
    return TaxiDriverCar(
      carId: carId ?? this.carId,
      taxiDriverId: taxiDriverId ?? this.taxiDriverId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carId': carId,
      'taxiDriverId': taxiDriverId,
      'isDeleted': isDeleted,
    };
  }

  factory TaxiDriverCar.fromMap(Map<String, dynamic> map) {
    return TaxiDriverCar(
      carId: map['carId'] != null ? map['carId'] as int : null,
      taxiDriverId:
          map['taxiDriverId'] != null ? map['taxiDriverId'] as int : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaxiDriverCar.fromJson(String source) =>
      TaxiDriverCar.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'TaxiDriverCar(carId: $carId, taxiDriverId: $taxiDriverId, isDeleted: $isDeleted)';

  @override
  bool operator ==(covariant TaxiDriverCar other) {
    if (identical(this, other)) return true;

    return other.carId == carId &&
        other.taxiDriverId == taxiDriverId &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode =>
      carId.hashCode ^ taxiDriverId.hashCode ^ isDeleted.hashCode;
}
