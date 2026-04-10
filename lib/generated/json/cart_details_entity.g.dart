import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/cart_details_entity.dart';

CartDetailsEntity $CartDetailsEntityFromJson(Map<String, dynamic> json) {
  final CartDetailsEntity cartDetailsEntity = CartDetailsEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    cartDetailsEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    cartDetailsEntity.message = message;
  }
  final CartDetailsData? data = jsonConvert.convert<CartDetailsData>(
      json['data']);
  if (data != null) {
    cartDetailsEntity.data = data;
  }
  return cartDetailsEntity;
}

Map<String, dynamic> $CartDetailsEntityToJson(CartDetailsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension CartDetailsEntityExtension on CartDetailsEntity {
  CartDetailsEntity copyWith({
    int? status,
    String? message,
    CartDetailsData? data,
  }) {
    return CartDetailsEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

CartDetailsData $CartDetailsDataFromJson(Map<String, dynamic> json) {
  final CartDetailsData cartDetailsData = CartDetailsData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    cartDetailsData.id = id;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    cartDetailsData.productId = productId;
  }
  final String? quantity = jsonConvert.convert<String>(json['quantity']);
  if (quantity != null) {
    cartDetailsData.quantity = quantity;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    cartDetailsData.userId = userId;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    cartDetailsData.status = status;
  }
  final String? stockId = jsonConvert.convert<String>(json['stock_id']);
  if (stockId != null) {
    cartDetailsData.stockId = stockId;
  }
  final String? pointsRedeemed = jsonConvert.convert<String>(
      json['points_redeemed']);
  if (pointsRedeemed != null) {
    cartDetailsData.pointsRedeemed = pointsRedeemed;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    cartDetailsData.createdAt = createdAt;
  }
  return cartDetailsData;
}

Map<String, dynamic> $CartDetailsDataToJson(CartDetailsData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['product_id'] = entity.productId;
  data['quantity'] = entity.quantity;
  data['user_id'] = entity.userId;
  data['status'] = entity.status;
  data['stock_id'] = entity.stockId;
  data['points_redeemed'] = entity.pointsRedeemed;
  data['created_at'] = entity.createdAt;
  return data;
}

extension CartDetailsDataExtension on CartDetailsData {
  CartDetailsData copyWith({
    String? id,
    String? productId,
    String? quantity,
    String? userId,
    String? status,
    String? stockId,
    String? pointsRedeemed,
    String? createdAt,
  }) {
    return CartDetailsData()
      ..id = id ?? this.id
      ..productId = productId ?? this.productId
      ..quantity = quantity ?? this.quantity
      ..userId = userId ?? this.userId
      ..status = status ?? this.status
      ..stockId = stockId ?? this.stockId
      ..pointsRedeemed = pointsRedeemed ?? this.pointsRedeemed
      ..createdAt = createdAt ?? this.createdAt;
  }
}