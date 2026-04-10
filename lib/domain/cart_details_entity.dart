import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/cart_details_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/cart_details_entity.g.dart';

@JsonSerializable()
class CartDetailsEntity {
	int? status = 0;
	String? message = '';
	CartDetailsData? data;

	CartDetailsEntity();

	factory CartDetailsEntity.fromJson(Map<String, dynamic> json) => $CartDetailsEntityFromJson(json);

	Map<String, dynamic> toJson() => $CartDetailsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CartDetailsData {
	String? id = '';
	@JSONField(name: "product_id")
	String? productId = '';
	String? quantity = '';
	@JSONField(name: "user_id")
	String? userId = '';
	String? status = '';
	@JSONField(name: "stock_id")
	String? stockId = '';
	@JSONField(name: "points_redeemed")
	String? pointsRedeemed = '';
	@JSONField(name: "created_at")
	String? createdAt = '';

	CartDetailsData();

	factory CartDetailsData.fromJson(Map<String, dynamic> json) => $CartDetailsDataFromJson(json);

	Map<String, dynamic> toJson() => $CartDetailsDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}