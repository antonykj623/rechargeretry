import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/country_list_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/country_list_entity.g.dart';

@JsonSerializable()
class CountryListEntity {
	int? status = 0;
	String? message = '';
	List<CountryListData>? data = [];

	CountryListEntity();

	factory CountryListEntity.fromJson(Map<String, dynamic> json) => $CountryListEntityFromJson(json);

	Map<String, dynamic> toJson() => $CountryListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CountryListData {
	@JSONField(name: "country_id")
	String? countryId = '';
	@JSONField(name: "country_name")
	String? countryName = '';
	List<CountryListDataData>? data = [];

	CountryListData();

	factory CountryListData.fromJson(Map<String, dynamic> json) => $CountryListDataFromJson(json);

	Map<String, dynamic> toJson() => $CountryListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CountryListDataData {
	String? id = '';
	String? code = '';
	@JSONField(name: "state_name")
	String? stateName = '';
	@JSONField(name: "state_code")
	String? stateCode = '';
	@JSONField(name: "cess1_name")
	String? cess1Name = '';
	@JSONField(name: "cess1_percent")
	String? cess1Percent = '';
	@JSONField(name: "cess2_name")
	String? cess2Name = '';
	@JSONField(name: "cess2_percent")
	String? cess2Percent = '';
	@JSONField(name: "wef_date")
	String? wefDate = '';
	String? countryid = '';

	CountryListDataData();

	factory CountryListDataData.fromJson(Map<String, dynamic> json) => $CountryListDataDataFromJson(json);

	Map<String, dynamic> toJson() => $CountryListDataDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}