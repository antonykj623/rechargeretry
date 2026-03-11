import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/k_y_c_details_entity.dart';

KYCDetailsEntity $KYCDetailsEntityFromJson(Map<String, dynamic> json) {
  final KYCDetailsEntity kYCDetailsEntity = KYCDetailsEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    kYCDetailsEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    kYCDetailsEntity.message = message;
  }
  final KYCDetailsData? data = jsonConvert.convert<KYCDetailsData>(
      json['data']);
  if (data != null) {
    kYCDetailsEntity.data = data;
  }
  return kYCDetailsEntity;
}

Map<String, dynamic> $KYCDetailsEntityToJson(KYCDetailsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension KYCDetailsEntityExtension on KYCDetailsEntity {
  KYCDetailsEntity copyWith({
    int? status,
    String? message,
    KYCDetailsData? data,
  }) {
    return KYCDetailsEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

KYCDetailsData $KYCDetailsDataFromJson(Map<String, dynamic> json) {
  final KYCDetailsData kYCDetailsData = KYCDetailsData();
  final String? adharNo = jsonConvert.convert<String>(json['adhar_no']);
  if (adharNo != null) {
    kYCDetailsData.adharNo = adharNo;
  }
  final String? panNo = jsonConvert.convert<String>(json['pan_no']);
  if (panNo != null) {
    kYCDetailsData.panNo = panNo;
  }
  final String? bankAccountName = jsonConvert.convert<String>(
      json['bank_account_name']);
  if (bankAccountName != null) {
    kYCDetailsData.bankAccountName = bankAccountName;
  }
  final String? bankName = jsonConvert.convert<String>(json['bank_name']);
  if (bankName != null) {
    kYCDetailsData.bankName = bankName;
  }
  final String? bankCheckleafPhoto = jsonConvert.convert<String>(
      json['bank_checkleaf_photo']);
  if (bankCheckleafPhoto != null) {
    kYCDetailsData.bankCheckleafPhoto = bankCheckleafPhoto;
  }
  final String? ifsc = jsonConvert.convert<String>(json['ifsc']);
  if (ifsc != null) {
    kYCDetailsData.ifsc = ifsc;
  }
  final String? branchName = jsonConvert.convert<String>(json['branch_name']);
  if (branchName != null) {
    kYCDetailsData.branchName = branchName;
  }
  final String? panPhoto = jsonConvert.convert<String>(json['pan_photo']);
  if (panPhoto != null) {
    kYCDetailsData.panPhoto = panPhoto;
  }
  final String? adharPhoto = jsonConvert.convert<String>(json['adhar_photo']);
  if (adharPhoto != null) {
    kYCDetailsData.adharPhoto = adharPhoto;
  }
  final String? bankAccountNo = jsonConvert.convert<String>(
      json['bank_account_no']);
  if (bankAccountNo != null) {
    kYCDetailsData.bankAccountNo = bankAccountNo;
  }
  return kYCDetailsData;
}

Map<String, dynamic> $KYCDetailsDataToJson(KYCDetailsData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['adhar_no'] = entity.adharNo;
  data['pan_no'] = entity.panNo;
  data['bank_account_name'] = entity.bankAccountName;
  data['bank_name'] = entity.bankName;
  data['bank_checkleaf_photo'] = entity.bankCheckleafPhoto;
  data['ifsc'] = entity.ifsc;
  data['branch_name'] = entity.branchName;
  data['pan_photo'] = entity.panPhoto;
  data['adhar_photo'] = entity.adharPhoto;
  data['bank_account_no'] = entity.bankAccountNo;
  return data;
}

extension KYCDetailsDataExtension on KYCDetailsData {
  KYCDetailsData copyWith({
    String? adharNo,
    String? panNo,
    String? bankAccountName,
    String? bankName,
    String? bankCheckleafPhoto,
    String? ifsc,
    String? branchName,
    String? panPhoto,
    String? adharPhoto,
    String? bankAccountNo,
  }) {
    return KYCDetailsData()
      ..adharNo = adharNo ?? this.adharNo
      ..panNo = panNo ?? this.panNo
      ..bankAccountName = bankAccountName ?? this.bankAccountName
      ..bankName = bankName ?? this.bankName
      ..bankCheckleafPhoto = bankCheckleafPhoto ?? this.bankCheckleafPhoto
      ..ifsc = ifsc ?? this.ifsc
      ..branchName = branchName ?? this.branchName
      ..panPhoto = panPhoto ?? this.panPhoto
      ..adharPhoto = adharPhoto ?? this.adharPhoto
      ..bankAccountNo = bankAccountNo ?? this.bankAccountNo;
  }
}