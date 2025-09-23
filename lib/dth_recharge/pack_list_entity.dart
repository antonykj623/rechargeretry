import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/pack_list_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/pack_list_entity.g.dart';

@JsonSerializable()
class PackListEntity {
	String? status = '';
	List<PackListPacks>? packs = [];

	PackListEntity();

	factory PackListEntity.fromJson(Map<String, dynamic> json) => $PackListEntityFromJson(json);

	Map<String, dynamic> toJson() => $PackListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PackListPacks {
	int? id = 0;
	String? name = '';
	String? type = '';
	List<String>? languages = [];
	String? pictureQuality = '';
	List<PackListPacksPrices>? prices = [];

	PackListPacks();

	factory PackListPacks.fromJson(Map<String, dynamic> json) => $PackListPacksFromJson(json);

	Map<String, dynamic> toJson() => $PackListPacksToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class PackListPacksPrices {
	int? amount = 0;
	int? validityMonths = 0;
	int? effectiveMonthlyPrice = 0;
	String? validity = '';
	bool? ncf = false;
	int? extraValidityDays = 0;

	PackListPacksPrices();

	factory PackListPacksPrices.fromJson(Map<String, dynamic> json) => $PackListPacksPricesFromJson(json);

	Map<String, dynamic> toJson() => $PackListPacksPricesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}