// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Order {
  int? orderId;
  int? taxiId;
  int? userId;
  int? taxiDriverId;
  DateTime? timeUntilArrival;
  int? orderStatusId;
  bool? isDeleted;
  Order({
    this.orderId,
    this.taxiId,
    this.userId,
    this.taxiDriverId,
    this.timeUntilArrival,
    this.orderStatusId,
    this.isDeleted,
  });

  Order copyWith({
    int? orderId,
    int? taxiId,
    int? userId,
    int? taxiDriverId,
    DateTime? timeUntilArrival,
    int? orderStatusId,
    bool? isDeleted,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      taxiId: taxiId ?? this.taxiId,
      userId: userId ?? this.userId,
      taxiDriverId: taxiDriverId ?? this.taxiDriverId,
      timeUntilArrival: timeUntilArrival ?? this.timeUntilArrival,
      orderStatusId: orderStatusId ?? this.orderStatusId,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderId': orderId,
      'taxiId': taxiId,
      'userId': userId,
      'taxiDriverId': taxiDriverId,
      'timeUntilArrival': timeUntilArrival?.millisecondsSinceEpoch,
      'orderStatusId': orderStatusId,
      'isDeleted': isDeleted,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      orderId: map['orderId'] != null ? map['orderId'] as int : null,
      taxiId: map['taxiId'] != null ? map['taxiId'] as int : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
      taxiDriverId:
          map['taxiDriverId'] != null ? map['taxiDriverId'] as int : null,
      timeUntilArrival: map['timeUntilArrival'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['timeUntilArrival'] as int)
          : null,
      orderStatusId:
          map['orderStatusId'] != null ? map['orderStatusId'] as int : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Order.fromJson(String source) =>
      Order.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Order(orderId: $orderId, taxiId: $taxiId, userId: $userId, taxiDriverId: $taxiDriverId, timeUntilArrival: $timeUntilArrival, orderStatusId: $orderStatusId, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant Order other) {
    if (identical(this, other)) return true;

    return other.orderId == orderId &&
        other.taxiId == taxiId &&
        other.userId == userId &&
        other.taxiDriverId == taxiDriverId &&
        other.timeUntilArrival == timeUntilArrival &&
        other.orderStatusId == orderStatusId &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return orderId.hashCode ^
        taxiId.hashCode ^
        userId.hashCode ^
        taxiDriverId.hashCode ^
        timeUntilArrival.hashCode ^
        orderStatusId.hashCode ^
        isDeleted.hashCode;
  }
}
