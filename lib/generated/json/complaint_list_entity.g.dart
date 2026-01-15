import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/complaint_list_entity.dart';

ComplaintListEntity $ComplaintListEntityFromJson(Map<String, dynamic> json) {
  final ComplaintListEntity complaintListEntity = ComplaintListEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    complaintListEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    complaintListEntity.message = message;
  }
  final List<ComplaintListData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<ComplaintListData>(e) as ComplaintListData)
      .toList();
  if (data != null) {
    complaintListEntity.data = data;
  }
  return complaintListEntity;
}

Map<String, dynamic> $ComplaintListEntityToJson(ComplaintListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension ComplaintListEntityExtension on ComplaintListEntity {
  ComplaintListEntity copyWith({
    int? status,
    String? message,
    List<ComplaintListData>? data,
  }) {
    return ComplaintListEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

ComplaintListData $ComplaintListDataFromJson(Map<String, dynamic> json) {
  final ComplaintListData complaintListData = ComplaintListData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    complaintListData.id = id;
  }
  final String? mobileApp = jsonConvert.convert<String>(json['mobile_app']);
  if (mobileApp != null) {
    complaintListData.mobileApp = mobileApp;
  }
  final String? issueName = jsonConvert.convert<String>(json['issue_name']);
  if (issueName != null) {
    complaintListData.issueName = issueName;
  }
  final String? orderid = jsonConvert.convert<String>(json['orderid']);
  if (orderid != null) {
    complaintListData.orderid = orderid;
  }
  final String? issueDetails = jsonConvert.convert<String>(
      json['issue_details']);
  if (issueDetails != null) {
    complaintListData.issueDetails = issueDetails;
  }
  final String? person = jsonConvert.convert<String>(json['person']);
  if (person != null) {
    complaintListData.person = person;
  }
  final String? source = jsonConvert.convert<String>(json['source']);
  if (source != null) {
    complaintListData.source = source;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    complaintListData.status = status;
  }
  final String? actionDetails = jsonConvert.convert<String>(
      json['action_details']);
  if (actionDetails != null) {
    complaintListData.actionDetails = actionDetails;
  }
  final String? createdDate = jsonConvert.convert<String>(json['created_date']);
  if (createdDate != null) {
    complaintListData.createdDate = createdDate;
  }
  final dynamic updatedDate = json['updated_date'];
  if (updatedDate != null) {
    complaintListData.updatedDate = updatedDate;
  }
  return complaintListData;
}

Map<String, dynamic> $ComplaintListDataToJson(ComplaintListData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['mobile_app'] = entity.mobileApp;
  data['issue_name'] = entity.issueName;
  data['orderid'] = entity.orderid;
  data['issue_details'] = entity.issueDetails;
  data['person'] = entity.person;
  data['source'] = entity.source;
  data['status'] = entity.status;
  data['action_details'] = entity.actionDetails;
  data['created_date'] = entity.createdDate;
  data['updated_date'] = entity.updatedDate;
  return data;
}

extension ComplaintListDataExtension on ComplaintListData {
  ComplaintListData copyWith({
    String? id,
    String? mobileApp,
    String? issueName,
    String? orderid,
    String? issueDetails,
    String? person,
    String? source,
    String? status,
    String? actionDetails,
    String? createdDate,
    dynamic updatedDate,
  }) {
    return ComplaintListData()
      ..id = id ?? this.id
      ..mobileApp = mobileApp ?? this.mobileApp
      ..issueName = issueName ?? this.issueName
      ..orderid = orderid ?? this.orderid
      ..issueDetails = issueDetails ?? this.issueDetails
      ..person = person ?? this.person
      ..source = source ?? this.source
      ..status = status ?? this.status
      ..actionDetails = actionDetails ?? this.actionDetails
      ..createdDate = createdDate ?? this.createdDate
      ..updatedDate = updatedDate ?? this.updatedDate;
  }
}