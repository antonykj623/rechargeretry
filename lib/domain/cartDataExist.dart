import 'dart:convert';

import 'cartExist.dart';

class CartDataExistEntity {
  int? status;
  String? message;
  List<CartDataExistData>? data;

  CartDataExistEntity({
    this.status,
    this.message,
    this.data,
  });

  // FROM JSON
  factory CartDataExistEntity.fromJson(Map<String, dynamic> json) {
    return CartDataExistEntity(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null
          ? List<CartDataExistData>.from(
          json['data'].map((x) => CartDataExistData.fromJson(x)))
          : [],
    );
  }

  // TO JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data != null
          ? data!.map((x) => x.toJson()).toList()
          : [],
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}