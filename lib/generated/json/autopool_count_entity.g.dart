import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/autopool_count_entity.dart';

AutopoolCountEntity $AutopoolCountEntityFromJson(Map<String, dynamic> json) {
  final AutopoolCountEntity autopoolCountEntity = AutopoolCountEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    autopoolCountEntity.status = status;
  }
  final AutopoolCountData? data = jsonConvert.convert<AutopoolCountData>(
      json['data']);
  if (data != null) {
    autopoolCountEntity.data = data;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    autopoolCountEntity.message = message;
  }
  return autopoolCountEntity;
}

Map<String, dynamic> $AutopoolCountEntityToJson(AutopoolCountEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['data'] = entity.data?.toJson();
  data['message'] = entity.message;
  return data;
}

extension AutopoolCountEntityExtension on AutopoolCountEntity {
  AutopoolCountEntity copyWith({
    int? status,
    AutopoolCountData? data,
    String? message,
  }) {
    return AutopoolCountEntity()
      ..status = status ?? this.status
      ..data = data ?? this.data
      ..message = message ?? this.message;
  }
}

AutopoolCountData $AutopoolCountDataFromJson(Map<String, dynamic> json) {
  final AutopoolCountData autopoolCountData = AutopoolCountData();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    autopoolCountData.id = id;
  }
  final String? regId = jsonConvert.convert<String>(json['reg_id']);
  if (regId != null) {
    autopoolCountData.regId = regId;
  }
  final String? totalIdCount = jsonConvert.convert<String>(
      json['total_id_count']);
  if (totalIdCount != null) {
    autopoolCountData.totalIdCount = totalIdCount;
  }
  final String? usedCount = jsonConvert.convert<String>(json['used_count']);
  if (usedCount != null) {
    autopoolCountData.usedCount = usedCount;
  }
  final String? avilableCount = jsonConvert.convert<String>(
      json['avilable_count']);
  if (avilableCount != null) {
    autopoolCountData.avilableCount = avilableCount;
  }
  final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
  if (updatedAt != null) {
    autopoolCountData.updatedAt = updatedAt;
  }
  return autopoolCountData;
}

Map<String, dynamic> $AutopoolCountDataToJson(AutopoolCountData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['reg_id'] = entity.regId;
  data['total_id_count'] = entity.totalIdCount;
  data['used_count'] = entity.usedCount;
  data['avilable_count'] = entity.avilableCount;
  data['updated_at'] = entity.updatedAt;
  return data;
}

extension AutopoolCountDataExtension on AutopoolCountData {
  AutopoolCountData copyWith({
    String? id,
    String? regId,
    String? totalIdCount,
    String? usedCount,
    String? avilableCount,
    String? updatedAt,
  }) {
    return AutopoolCountData()
      ..id = id ?? this.id
      ..regId = regId ?? this.regId
      ..totalIdCount = totalIdCount ?? this.totalIdCount
      ..usedCount = usedCount ?? this.usedCount
      ..avilableCount = avilableCount ?? this.avilableCount
      ..updatedAt = updatedAt ?? this.updatedAt;
  }
}