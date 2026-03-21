import 'dart:convert';

class CartDataExistData {
  String? id;
  String? productId;
  String? quantity;
  String? userId;
  String? status;

  CartDataExistData({
    this.id,
    this.productId,
    this.quantity,
    this.userId,
    this.status,
  });

  // FROM JSON
  factory CartDataExistData.fromJson(Map<String, dynamic> json) {
    return CartDataExistData(
      id: json['id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      userId: json['user_id'],
      status: json['status'],
    );
  }

  // TO JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_id': productId,
      'quantity': quantity,
      'user_id': userId,
      'status': status,
    };
  }

  @override
  String toString() => jsonEncode(toJson());
}