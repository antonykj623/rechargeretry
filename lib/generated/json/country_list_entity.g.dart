import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/country_list_entity.dart';

CountryListEntity $CountryListEntityFromJson(Map<String, dynamic> json) {
  final CountryListEntity countryListEntity = CountryListEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    countryListEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    countryListEntity.message = message;
  }
  final List<CountryListData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CountryListData>(e) as CountryListData)
      .toList();
  if (data != null) {
    countryListEntity.data = data;
  }
  return countryListEntity;
}

Map<String, dynamic> $CountryListEntityToJson(CountryListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension CountryListEntityExtension on CountryListEntity {
  CountryListEntity copyWith({
    int? status,
    String? message,
    List<CountryListData>? data,
  }) {
    return CountryListEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

CountryListData $CountryListDataFromJson(Map<String, dynamic> json) {
  final CountryListData countryListData = CountryListData();
  final String? countryId = jsonConvert.convert<String>(json['country_id']);
  if (countryId != null) {
    countryListData.countryId = countryId;
  }
  final String? countryName = jsonConvert.convert<String>(json['country_name']);
  if (countryName != null) {
    countryListData.countryName = countryName;
  }
  final List<CountryListDataData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<CountryListDataData>(e) as CountryListDataData)
      .toList();
  if (data != null) {
    countryListData.data = data;
  }
  return countryListData;
}

Map<String, dynamic> $CountryListDataToJson(CountryListData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['country_id'] = entity.countryId;
  data['country_name'] = entity.countryName;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension CountryListDataExtension on CountryListData {
  CountryListData copyWith({
    String? countryId,
    String? countryName,
    List<CountryListDataData>? data,
  }) {
    return CountryListData()
      ..countryId = countryId ?? this.countryId
      ..countryName = countryName ?? this.countryName
      ..data = data ?? this.data;
  }
}

CountryListDataData $CountryListDataDataFromJson(Map<String, dynamic> json) {
  final CountryListDataData countryListDataData = CountryListDataData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    countryListDataData.id = id;
  }
  final String? code = jsonConvert.convert<String>(json['code']);
  if (code != null) {
    countryListDataData.code = code;
  }
  final String? stateName = jsonConvert.convert<String>(json['state_name']);
  if (stateName != null) {
    countryListDataData.stateName = stateName;
  }
  final String? stateCode = jsonConvert.convert<String>(json['state_code']);
  if (stateCode != null) {
    countryListDataData.stateCode = stateCode;
  }
  final String? cess1Name = jsonConvert.convert<String>(json['cess1_name']);
  if (cess1Name != null) {
    countryListDataData.cess1Name = cess1Name;
  }
  final String? cess1Percent = jsonConvert.convert<String>(
      json['cess1_percent']);
  if (cess1Percent != null) {
    countryListDataData.cess1Percent = cess1Percent;
  }
  final String? cess2Name = jsonConvert.convert<String>(json['cess2_name']);
  if (cess2Name != null) {
    countryListDataData.cess2Name = cess2Name;
  }
  final String? cess2Percent = jsonConvert.convert<String>(
      json['cess2_percent']);
  if (cess2Percent != null) {
    countryListDataData.cess2Percent = cess2Percent;
  }
  final String? wefDate = jsonConvert.convert<String>(json['wef_date']);
  if (wefDate != null) {
    countryListDataData.wefDate = wefDate;
  }
  final String? countryid = jsonConvert.convert<String>(json['countryid']);
  if (countryid != null) {
    countryListDataData.countryid = countryid;
  }
  return countryListDataData;
}

Map<String, dynamic> $CountryListDataDataToJson(CountryListDataData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['code'] = entity.code;
  data['state_name'] = entity.stateName;
  data['state_code'] = entity.stateCode;
  data['cess1_name'] = entity.cess1Name;
  data['cess1_percent'] = entity.cess1Percent;
  data['cess2_name'] = entity.cess2Name;
  data['cess2_percent'] = entity.cess2Percent;
  data['wef_date'] = entity.wefDate;
  data['countryid'] = entity.countryid;
  return data;
}

extension CountryListDataDataExtension on CountryListDataData {
  CountryListDataData copyWith({
    String? id,
    String? code,
    String? stateName,
    String? stateCode,
    String? cess1Name,
    String? cess1Percent,
    String? cess2Name,
    String? cess2Percent,
    String? wefDate,
    String? countryid,
  }) {
    return CountryListDataData()
      ..id = id ?? this.id
      ..code = code ?? this.code
      ..stateName = stateName ?? this.stateName
      ..stateCode = stateCode ?? this.stateCode
      ..cess1Name = cess1Name ?? this.cess1Name
      ..cess1Percent = cess1Percent ?? this.cess1Percent
      ..cess2Name = cess2Name ?? this.cess2Name
      ..cess2Percent = cess2Percent ?? this.cess2Percent
      ..wefDate = wefDate ?? this.wefDate
      ..countryid = countryid ?? this.countryid;
  }
}