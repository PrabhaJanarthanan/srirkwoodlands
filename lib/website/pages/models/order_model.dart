import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String orderId;
  List<Map<String, dynamic>> cartItems;
  String status;
  DateTime orderDate;

  OrderModel({
    required this.orderId,
    required this.cartItems,
    required this.status,
    required this.orderDate,
  });
  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
