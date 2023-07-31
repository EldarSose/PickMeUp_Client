// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Car {
  int? carId;
  int? taxiId;
  String? carModel;
  String? taxiNumber;
  String? plateNumber;
  bool? isDeleted;
  Car({
    this.carId,
    this.taxiId,
    this.carModel,
    this.taxiNumber,
    this.plateNumber,
    this.isDeleted,
  });

  Car copyWith({
    int? carId,
    int? taxiId,
    String? carModel,
    String? taxiNumber,
    String? plateNumber,
    bool? isDeleted,
  }) {
    return Car(
      carId: carId ?? this.carId,
      taxiId: taxiId ?? this.taxiId,
      carModel: carModel ?? this.carModel,
      taxiNumber: taxiNumber ?? this.taxiNumber,
      plateNumber: plateNumber ?? this.plateNumber,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'carId': carId,
      'taxiId': taxiId,
      'carModel': carModel,
      'taxiNumber': taxiNumber,
      'plateNumber': plateNumber,
      'isDeleted': isDeleted,
    };
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      carId: map['carId'] != null ? map['carId'] as int : null,
      taxiId: map['taxiId'] != null ? map['taxiId'] as int : null,
      carModel: map['carModel'] != null ? map['carModel'] as String : null,
      taxiNumber:
          map['taxiNumber'] != null ? map['taxiNumber'] as String : null,
      plateNumber:
          map['plateNumber'] != null ? map['plateNumber'] as String : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) =>
      Car.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Car(carId: $carId, taxiId: $taxiId, carModel: $carModel, taxiNumber: $taxiNumber, plateNumber: $plateNumber, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant Car other) {
    if (identical(this, other)) return true;

    return other.carId == carId &&
        other.taxiId == taxiId &&
        other.carModel == carModel &&
        other.taxiNumber == taxiNumber &&
        other.plateNumber == plateNumber &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return carId.hashCode ^
        taxiId.hashCode ^
        carModel.hashCode ^
        taxiNumber.hashCode ^
        plateNumber.hashCode ^
        isDeleted.hashCode;
  }
}
