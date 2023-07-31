// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Shift {
  int? shiftId;
  DateTime? startTime;
  DateTime? endTime;
  int? taxiDriverId;
  int? taxiCompanyId;
  bool? tookABreak;
  bool? isDeleted;
  Shift({
    this.shiftId,
    this.startTime,
    this.endTime,
    this.taxiDriverId,
    this.taxiCompanyId,
    this.tookABreak,
    this.isDeleted,
  });

  Shift copyWith({
    int? shiftId,
    DateTime? startTime,
    DateTime? endTime,
    int? taxiDriverId,
    int? taxiCompanyId,
    bool? tookABreak,
    bool? isDeleted,
  }) {
    return Shift(
      shiftId: shiftId ?? this.shiftId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      taxiDriverId: taxiDriverId ?? this.taxiDriverId,
      taxiCompanyId: taxiCompanyId ?? this.taxiCompanyId,
      tookABreak: tookABreak ?? this.tookABreak,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shiftId': shiftId,
      'startTime': startTime?.millisecondsSinceEpoch,
      'endTime': endTime?.millisecondsSinceEpoch,
      'taxiDriverId': taxiDriverId,
      'taxiCompanyId': taxiCompanyId,
      'tookABreak': tookABreak,
      'isDeleted': isDeleted,
    };
  }

  factory Shift.fromMap(Map<String, dynamic> map) {
    return Shift(
      shiftId: map['shiftId'] != null ? map['shiftId'] as int : null,
      startTime: map['startTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int)
          : null,
      endTime: map['endTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int)
          : null,
      taxiDriverId:
          map['taxiDriverId'] != null ? map['taxiDriverId'] as int : null,
      taxiCompanyId:
          map['taxiCompanyId'] != null ? map['taxiCompanyId'] as int : null,
      tookABreak: map['tookABreak'] != null ? map['tookABreak'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shift.fromJson(String source) =>
      Shift.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Shift(shiftId: $shiftId, startTime: $startTime, endTime: $endTime, taxiDriverId: $taxiDriverId, taxiCompanyId: $taxiCompanyId, tookABreak: $tookABreak, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant Shift other) {
    if (identical(this, other)) return true;

    return other.shiftId == shiftId &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.taxiDriverId == taxiDriverId &&
        other.taxiCompanyId == taxiCompanyId &&
        other.tookABreak == tookABreak &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return shiftId.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        taxiDriverId.hashCode ^
        taxiCompanyId.hashCode ^
        tookABreak.hashCode ^
        isDeleted.hashCode;
  }
}
