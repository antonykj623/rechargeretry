import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/recharge_history_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/recharge_history_entity.g.dart';

@JsonSerializable()
class RechargeHistoryEntity {
	int? status = 0;
	String? message = '';
	List<RechargeHistoryData>? data = [];

	RechargeHistoryEntity();

	factory RechargeHistoryEntity.fromJson(Map<String, dynamic> json) => $RechargeHistoryEntityFromJson(json);

	Map<String, dynamic> toJson() => $RechargeHistoryEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class RechargeHistoryData {
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

	RechargeHistoryData();

	factory RechargeHistoryData.fromJson(Map<String, dynamic> json) => $RechargeHistoryDataFromJson(json);

	Map<String, dynamic> toJson() => $RechargeHistoryDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}