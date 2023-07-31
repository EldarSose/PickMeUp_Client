// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderStatus {
  int? orderStatusId;
  String? orderStatusName;
  String? orderStatusDescription;
  bool? isDeleted;
  OrderStatus({
    this.orderStatusId,
    this.orderStatusName,
    this.orderStatusDescription,
    this.isDeleted,
  });

  OrderStatus copyWith({
    int? orderStatusId,
    String? orderStatusName,
    String? orderStatusDescription,
    bool? isDeleted,
  }) {
    return OrderStatus(
      orderStatusId: orderStatusId ?? this.orderStatusId,
      orderStatusName: orderStatusName ?? this.orderStatusName,
      orderStatusDescription:
          orderStatusDescription ?? this.orderStatusDescription,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'orderStatusId': orderStatusId,
      'orderStatusName': orderStatusName,
      'orderStatusDescription': orderStatusDescription,
      'isDeleted': isDeleted,
    };
  }

  factory OrderStatus.fromMap(Map<String, dynamic> map) {
    return OrderStatus(
      orderStatusId:
          map['orderStatusId'] != null ? map['orderStatusId'] as int : null,
      orderStatusName: map['orderStatusName'] != null
          ? map['orderStatusName'] as String
          : null,
      orderStatusDescription: map['orderStatusDescription'] != null
          ? map['orderStatusDescription'] as String
          : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderStatus.fromJson(String source) =>
      OrderStatus.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderStatus(orderStatusId: $orderStatusId, orderStatusName: $orderStatusName, orderStatusDescription: $orderStatusDescription, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(covariant OrderStatus other) {
    if (identical(this, other)) return true;

    return other.orderStatusId == orderStatusId &&
        other.orderStatusName == orderStatusName &&
        other.orderStatusDescription == orderStatusDescription &&
        other.isDeleted == isDeleted;
  }

  @override
  int get hashCode {
    return orderStatusId.hashCode ^
        orderStatusName.hashCode ^
        orderStatusDescription.hashCode ^
        isDeleted.hashCode;
  }
}
