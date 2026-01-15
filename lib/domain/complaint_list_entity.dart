import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/complaint_list_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/complaint_list_entity.g.dart';

@JsonSerializable()
class ComplaintListEntity {
	int? status = 0;
	String? message = '';
	List<ComplaintListData>? data = [];

	ComplaintListEntity();

	factory ComplaintListEntity.fromJson(Map<String, dynamic> json) => $ComplaintListEntityFromJson(json);

	Map<String, dynamic> toJson() => $ComplaintListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ComplaintListData {
	String? id = '';
	@JSONField(name: "mobile_app")
	String? mobileApp = '';
	@JSONField(name: "issue_name")
	String? issueName = '';
	String? orderid = '';
	@JSONField(name: "issue_details")
	String? issueDetails = '';
	String? person = '';
	String? source = '';
	String? status = '';
	@JSONField(name: "action_details")
	String? actionDetails = '';
	@JSONField(name: "created_date")
	String? createdDate = '';
	@JSONField(name: "updated_date")
	dynamic updatedDate;

	ComplaintListData();

	factory ComplaintListData.fromJson(Map<String, dynamic> json) => $ComplaintListDataFromJson(json);

	Map<String, dynamic> toJson() => $ComplaintListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}