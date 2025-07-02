import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/recharge_list_entity.dart';

RechargeListEntity $RechargeListEntityFromJson(Map<String, dynamic> json) {
  final RechargeListEntity rechargeListEntity = RechargeListEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    rechargeListEntity.status = status;
  }
  final List<RechargeListData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<RechargeListData>(e) as RechargeListData)
      .toList();
  if (data != null) {
    rechargeListEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    rechargeListEntity.message = message;
  }
  return rechargeListEntity;
}

Map<String, dynamic> $RechargeListEntityToJson(RechargeListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['message'] = entity.message;
  return data;
}

extension RechargeListEntityExtension on RechargeListEntity {
  RechargeListEntity copyWith({
    int? status,
    List<RechargeListData>? data,
    String? message,
  }) {
    return RechargeListEntity()
      ..status = status ?? this.status
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

RechargeListData $RechargeListDataFromJson(Map<String, dynamic> json) {
  final RechargeListData rechargeListData = RechargeListData();
  final String? rechargid = jsonConvert.convert<String>(json['rechargid']);
  if (rechargid != null) {
    rechargeListData.rechargid = rechargid;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    rechargeListData.id = id;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    rechargeListData.userId = userId;
  }
  final String? rechargeType = jsonConvert.convert<String>(
      json['recharge_type']);
  if (rechargeType != null) {
    rechargeListData.rechargeType = rechargeType;
  }
  final String? mobileNumber = jsonConvert.convert<String>(
      json['mobile_number']);
  if (mobileNumber != null) {
    rechargeListData.mobileNumber = mobileNumber;
  }
  final String? accountNumber = jsonConvert.convert<String>(
      json['account_number']);
  if (accountNumber != null) {
    rechargeListData.accountNumber = accountNumber;
  }
  final String? transactionId = jsonConvert.convert<String>(
      json['transaction_id']);
  if (transactionId != null) {
    rechargeListData.transactionId = transactionId;
  }
  final String? amount = jsonConvert.convert<String>(json['amount']);
  if (amount != null) {
    rechargeListData.amount = amount;
  }
  final String? rechargeamount = jsonConvert.convert<String>(
      json['rechargeamount']);
  if (rechargeamount != null) {
    rechargeListData.rechargeamount = rechargeamount;
  }
  final String? paymentMode = jsonConvert.convert<String>(json['Payment_Mode']);
  if (paymentMode != null) {
    rechargeListData.paymentMode = paymentMode;
  }
  final String? operator = jsonConvert.convert<String>(json['operator']);
  if (operator != null) {
    rechargeListData.operator = operator;
  }
  final String? rechargeDate = jsonConvert.convert<String>(
      json['recharge_date']);
  if (rechargeDate != null) {
    rechargeListData.rechargeDate = rechargeDate;
  }
  final String? spkey = jsonConvert.convert<String>(json['spkey']);
  if (spkey != null) {
    rechargeListData.spkey = spkey;
  }
  final String? rpId = jsonConvert.convert<String>(json['rp_id']);
  if (rpId != null) {
    rechargeListData.rpId = rpId;
  }
  final String? agentId = jsonConvert.convert<String>(json['agent_id']);
  if (agentId != null) {
    rechargeListData.agentId = agentId;
  }
  final String? operatorCirclerCode = jsonConvert.convert<String>(
      json['operator_circler_code']);
  if (operatorCirclerCode != null) {
    rechargeListData.operatorCirclerCode = operatorCirclerCode;
  }
  final String? paymentStatus = jsonConvert.convert<String>(
      json['payment_status']);
  if (paymentStatus != null) {
    rechargeListData.paymentStatus = paymentStatus;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    rechargeListData.status = status;
  }
  final String? genStatus = jsonConvert.convert<String>(json['gen_status']);
  if (genStatus != null) {
    rechargeListData.genStatus = genStatus;
  }
  final dynamic refundDate = json['refund_date'];
  if (refundDate != null) {
    rechargeListData.refundDate = refundDate;
  }
  final dynamic refundTransactionid = json['refund_transactionid'];
  if (refundTransactionid != null) {
    rechargeListData.refundTransactionid = refundTransactionid;
  }
  final String? transactionAmount = jsonConvert.convert<String>(
      json['transaction_amount']);
  if (transactionAmount != null) {
    rechargeListData.transactionAmount = transactionAmount;
  }
  final String? userid = jsonConvert.convert<String>(json['userid']);
  if (userid != null) {
    rechargeListData.userid = userid;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    rechargeListData.fullName = fullName;
  }
  return rechargeListData;
}

Map<String, dynamic> $RechargeListDataToJson(RechargeListData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['rechargid'] = entity.rechargid;
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
  data['userid'] = entity.userid;
  data['full_name'] = entity.fullName;
  return data;
}

extension RechargeListDataExtension on RechargeListData {
  RechargeListData copyWith({
    String? rechargid,
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
    String? userid,
    String? fullName,
  }) {
    return RechargeListData()
      ..rechargid = rechargid ?? this.rechargid
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
      ..transactionAmount = transactionAmount ?? this.transactionAmount
      ..userid = userid ?? this.userid
      ..fullName = fullName ?? this.fullName;
  }
}