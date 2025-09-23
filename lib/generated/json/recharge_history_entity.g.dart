import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/dth_recharge/report/recharge_history_entity.dart';

RechargeHistoryEntity $RechargeHistoryEntityFromJson(
    Map<String, dynamic> json) {
  final RechargeHistoryEntity rechargeHistoryEntity = RechargeHistoryEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    rechargeHistoryEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    rechargeHistoryEntity.message = message;
  }
  final List<RechargeHistoryData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<RechargeHistoryData>(e) as RechargeHistoryData)
      .toList();
  if (data != null) {
    rechargeHistoryEntity.data = data;
  }
  return rechargeHistoryEntity;
}

Map<String, dynamic> $RechargeHistoryEntityToJson(
    RechargeHistoryEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension RechargeHistoryEntityExtension on RechargeHistoryEntity {
  RechargeHistoryEntity copyWith({
    int? status,
    String? message,
    List<RechargeHistoryData>? data,
  }) {
    return RechargeHistoryEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

RechargeHistoryData $RechargeHistoryDataFromJson(Map<String, dynamic> json) {
  final RechargeHistoryData rechargeHistoryData = RechargeHistoryData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    rechargeHistoryData.id = id;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    rechargeHistoryData.userId = userId;
  }
  final String? rechargeType = jsonConvert.convert<String>(
      json['recharge_type']);
  if (rechargeType != null) {
    rechargeHistoryData.rechargeType = rechargeType;
  }
  final String? mobileNumber = jsonConvert.convert<String>(
      json['mobile_number']);
  if (mobileNumber != null) {
    rechargeHistoryData.mobileNumber = mobileNumber;
  }
  final String? accountNumber = jsonConvert.convert<String>(
      json['account_number']);
  if (accountNumber != null) {
    rechargeHistoryData.accountNumber = accountNumber;
  }
  final String? transactionId = jsonConvert.convert<String>(
      json['transaction_id']);
  if (transactionId != null) {
    rechargeHistoryData.transactionId = transactionId;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    rechargeHistoryData.amount = amount;
  }
  final String? rechargeamount = jsonConvert.convert<String>(
      json['rechargeamount']);
  if (rechargeamount != null) {
    rechargeHistoryData.rechargeamount = rechargeamount;
  }
  final String? paymentMode = jsonConvert.convert<String>(json['Payment_Mode']);
  if (paymentMode != null) {
    rechargeHistoryData.paymentMode = paymentMode;
  }
  final String? operator = jsonConvert.convert<String>(json['operator']);
  if (operator != null) {
    rechargeHistoryData.operator = operator;
  }
  final String? rechargeDate = jsonConvert.convert<String>(
      json['recharge_date']);
  if (rechargeDate != null) {
    rechargeHistoryData.rechargeDate = rechargeDate;
  }
  final String? spkey = jsonConvert.convert<String>(json['spkey']);
  if (spkey != null) {
    rechargeHistoryData.spkey = spkey;
  }
  final String? rpId = jsonConvert.convert<String>(json['rp_id']);
  if (rpId != null) {
    rechargeHistoryData.rpId = rpId;
  }
  final String? agentId = jsonConvert.convert<String>(json['agent_id']);
  if (agentId != null) {
    rechargeHistoryData.agentId = agentId;
  }
  final String? operatorCirclerCode = jsonConvert.convert<String>(
      json['operator_circler_code']);
  if (operatorCirclerCode != null) {
    rechargeHistoryData.operatorCirclerCode = operatorCirclerCode;
  }
  final String? paymentStatus = jsonConvert.convert<String>(
      json['payment_status']);
  if (paymentStatus != null) {
    rechargeHistoryData.paymentStatus = paymentStatus;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    rechargeHistoryData.status = status;
  }
  final String? genStatus = jsonConvert.convert<String>(json['gen_status']);
  if (genStatus != null) {
    rechargeHistoryData.genStatus = genStatus;
  }
  final dynamic refundDate = json['refund_date'];
  if (refundDate != null) {
    rechargeHistoryData.refundDate = refundDate;
  }
  final dynamic refundTransactionid = json['refund_transactionid'];
  if (refundTransactionid != null) {
    rechargeHistoryData.refundTransactionid = refundTransactionid;
  }
  final String? transactionAmount = jsonConvert.convert<String>(
      json['transaction_amount']);
  if (transactionAmount != null) {
    rechargeHistoryData.transactionAmount = transactionAmount;
  }
  return rechargeHistoryData;
}

Map<String, dynamic> $RechargeHistoryDataToJson(RechargeHistoryData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['user_id'] = entity.userId;
  data['recharge_type'] = entity.rechargeType;
  data['mobile_number'] = entity.mobileNumber;
  data['account_number'] = entity.accountNumber;
  data['transaction_id'] = entity.transactionId;
  data['amount'] = entity.amount;
  data['rechargeamount'] = entity.rechargeamount;
  data['Payment_Mode'] = entity.paymentMode;
  data['operator'] = entity.operator;
  data['recharge_date'] = entity.rechargeDate;
  data['spkey'] = entity.spkey;
  data['rp_id'] = entity.rpId;
  data['agent_id'] = entity.agentId;
  data['operator_circler_code'] = entity.operatorCirclerCode;
  data['payment_status'] = entity.paymentStatus;
  data['status'] = entity.status;
  data['gen_status'] = entity.genStatus;
  data['refund_date'] = entity.refundDate;
  data['refund_transactionid'] = entity.refundTransactionid;
  data['transaction_amount'] = entity.transactionAmount;
  return data;
}

extension RechargeHistoryDataExtension on RechargeHistoryData {
  RechargeHistoryData copyWith({
    String? id,
    String? userId,
    String? rechargeType,
    String? mobileNumber,
    String? accountNumber,
    String? transactionId,
    String? amount,
    String? rechargeamount,
    String? paymentMode,
    String? operator,
    String? rechargeDate,
    String? spkey,
    String? rpId,
    String? agentId,
    String? operatorCirclerCode,
    String? paymentStatus,
    String? status,
    String? genStatus,
    dynamic refundDate,
    dynamic refundTransactionid,
    String? transactionAmount,
  }) {
    return RechargeHistoryData()
      ..id = id ?? this.id
      ..userId = userId ?? this.userId
      ..rechargeType = rechargeType ?? this.rechargeType
      ..mobileNumber = mobileNumber ?? this.mobileNumber
      ..accountNumber = accountNumber ?? this.accountNumber
      ..transactionId = transactionId ?? this.transactionId
      ..amount = amount ?? this.amount
      ..rechargeamount = rechargeamount ?? this.rechargeamount
      ..paymentMode = paymentMode ?? this.paymentMode
      ..operator = operator ?? this.operator
      ..rechargeDate = rechargeDate ?? this.rechargeDate
      ..spkey = spkey ?? this.spkey
      ..rpId = rpId ?? this.rpId
      ..agentId = agentId ?? this.agentId
      ..operatorCirclerCode = operatorCirclerCode ?? this.operatorCirclerCode
      ..paymentStatus = paymentStatus ?? this.paymentStatus
      ..status = status ?? this.status
      ..genStatus = genStatus ?? this.genStatus
      ..refundDate = refundDate ?? this.refundDate
      ..refundTransactionid = refundTransactionid ?? this.refundTransactionid
      ..transactionAmount = transactionAmount ?? this.transactionAmount;
  }
}