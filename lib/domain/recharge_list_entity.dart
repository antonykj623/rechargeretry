import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/recharge_list_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/recharge_list_entity.g.dart';

@JsonSerializable()
class RechargeListEntity {
	int? status = 0;
	List<RechargeListData>? data = [];
	String? message = '';

	RechargeListEntity();

	factory RechargeListEntity.fromJson(Map<String, dynamic> json) => $RechargeListEntityFromJson(json);

	Map<String, dynamic> toJson() => $RechargeListEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class RechargeListData {
	String? rechargid = '';
	String? id = '';
	@JSONField(name: "user_id")
	String? userId = '';
	@JSONField(name: "recharge_type")
	String? rechargeType = '';
	@JSONField(name: "mobile_number")
	String? mobileNumber = '';
	@JSONField(name: "account_number")
	String? accountNumber = '';
	@JSONField(name: "transaction_id")
	String? transactionId = '';
	String? amount = '';
	String? rechargeamount = '';
	@JSONField(name: "Payment_Mode")
	String? paymentMode = '';
	String? operator = '';
	@JSONField(name: "recharge_date")
	String? rechargeDate = '';
	String? spkey = '';
	@JSONField(name: "rp_id")
	String? rpId = '';
	@JSONField(name: "agent_id")
	String? agentId = '';
	@JSONField(name: "operator_circler_code")
	String? operatorCirclerCode = '';
	@JSONField(name: "payment_status")
	String? paymentStatus = '';
	String? status = '';
	@JSONField(name: "gen_status")
	String? genStatus = '';
	@JSONField(name: "refund_date")
	dynamic refundDate;
	@JSONField(name: "refund_transactionid")
	dynamic refundTransactionid;
	@JSONField(name: "transaction_amount")
	String? transactionAmount = '';
	String? userid = '';
	@JSONField(name: "full_name")
	String? fullName = '';

	RechargeListData();

	factory RechargeListData.fromJson(Map<String, dynamic> json) => $RechargeListDataFromJson(json);

	Map<String, dynamic> toJson() => $RechargeListDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}