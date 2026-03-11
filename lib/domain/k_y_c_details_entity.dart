import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/k_y_c_details_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/k_y_c_details_entity.g.dart';

@JsonSerializable()
class KYCDetailsEntity {
	int? status = 0;
	String? message = '';
	KYCDetailsData? data;

	KYCDetailsEntity();

	factory KYCDetailsEntity.fromJson(Map<String, dynamic> json) => $KYCDetailsEntityFromJson(json);

	Map<String, dynamic> toJson() => $KYCDetailsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class KYCDetailsData {
	@JSONField(name: "adhar_no")
	String? adharNo = '';
	@JSONField(name: "pan_no")
	String? panNo = '';
	@JSONField(name: "bank_account_name")
	String? bankAccountName = '';
	@JSONField(name: "bank_name")
	String? bankName = '';
	@JSONField(name: "bank_checkleaf_photo")
	String? bankCheckleafPhoto = '';
	String? ifsc = '';
	@JSONField(name: "branch_name")
	String? branchName = '';
	@JSONField(name: "pan_photo")
	String? panPhoto = '';
	@JSONField(name: "adhar_photo")
	String? adharPhoto = '';
	@JSONField(name: "bank_account_no")
	String? bankAccountNo = '';

	KYCDetailsData();

	factory KYCDetailsData.fromJson(Map<String, dynamic> json) => $KYCDetailsDataFromJson(json);

	Map<String, dynamic> toJson() => $KYCDetailsDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}