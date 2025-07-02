import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/update_status_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/update_status_entity.g.dart';

@JsonSerializable()
class UpdateStatusEntity {
	int? status = 0;
	String? message = '';

	UpdateStatusEntity();

	factory UpdateStatusEntity.fromJson(Map<String, dynamic> json) => $UpdateStatusEntityFromJson(json);

	Map<String, dynamic> toJson() => $UpdateStatusEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}