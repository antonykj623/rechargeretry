import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/update_status_entity.dart';

UpdateStatusEntity $UpdateStatusEntityFromJson(Map<String, dynamic> json) {
  final UpdateStatusEntity updateStatusEntity = UpdateStatusEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    updateStatusEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    updateStatusEntity.message = message;
  }
  return updateStatusEntity;
}

Map<String, dynamic> $UpdateStatusEntityToJson(UpdateStatusEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  return data;
}

extension UpdateStatusEntityExtension on UpdateStatusEntity {
  UpdateStatusEntity copyWith({
    int? status,
    String? message,
  }) {
    return UpdateStatusEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message;
  }
}