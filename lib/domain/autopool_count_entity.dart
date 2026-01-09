import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/autopool_count_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/autopool_count_entity.g.dart';

@JsonSerializable()
class AutopoolCountEntity {
	int? status = 0;
	AutopoolCountData? data;
	String? message = '';

	AutopoolCountEntity();

	factory AutopoolCountEntity.fromJson(Map<String, dynamic> json) => $AutopoolCountEntityFromJson(json);

	Map<String, dynamic> toJson() => $AutopoolCountEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class AutopoolCountData {
	String? id = '';
	@JSONField(name: "reg_id")
	String? regId = '';
	@JSONField(name: "total_id_count")
	String? totalIdCount = '';
	@JSONField(name: "used_count")
	String? usedCount = '';
	@JSONField(name: "avilable_count")
	String? avilableCount = '';
	@JSONField(name: "updated_at")
	String? updatedAt = '';

	AutopoolCountData();

	factory AutopoolCountData.fromJson(Map<String, dynamic> json) => $AutopoolCountDataFromJson(json);

	Map<String, dynamic> toJson() => $AutopoolCountDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}