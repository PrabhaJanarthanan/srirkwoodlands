// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      orderId: json['orderId'] as String,
      cartItems: (json['cartItems'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      status: json['status'] as String,
      orderDate: DateTime.parse(json['orderDate'] as String),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'cartItems': instance.cartItems,
      'status': instance.status,
      'orderDate': instance.orderDate.toIso8601String(),
    };
