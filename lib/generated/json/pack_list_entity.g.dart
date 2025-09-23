import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/dth_recharge/pack_list_entity.dart';

PackListEntity $PackListEntityFromJson(Map<String, dynamic> json) {
  final PackListEntity packListEntity = PackListEntity();
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    packListEntity.status = status;
  }
  final List<PackListPacks>? packs = (json['packs'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<PackListPacks>(e) as PackListPacks)
      .toList();
  if (packs != null) {
    packListEntity.packs = packs;
  }
  return packListEntity;
}

Map<String, dynamic> $PackListEntityToJson(PackListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['packs'] = entity.packs?.map((v) => v.toJson()).toList();
  return data;
}

extension PackListEntityExtension on PackListEntity {
  PackListEntity copyWith({
    String? status,
    List<PackListPacks>? packs,
  }) {
    return PackListEntity()
      ..status = status ?? this.status
      ..packs = packs ?? this.packs;
  }
}

PackListPacks $PackListPacksFromJson(Map<String, dynamic> json) {
  final PackListPacks packListPacks = PackListPacks();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    packListPacks.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    packListPacks.name = name;
  }
  final String? type = jsonConvert.convert<String>(json['type']);
  if (type != null) {
    packListPacks.type = type;
  }
  final List<String>? languages = (json['languages'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (languages != null) {
    packListPacks.languages = languages;
  }
  final String? pictureQuality = jsonConvert.convert<String>(
      json['pictureQuality']);
  if (pictureQuality != null) {
    packListPacks.pictureQuality = pictureQuality;
  }
  final List<PackListPacksPrices>? prices = (json['prices'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<PackListPacksPrices>(e) as PackListPacksPrices)
      .toList();
  if (prices != null) {
    packListPacks.prices = prices;
  }
  return packListPacks;
}

Map<String, dynamic> $PackListPacksToJson(PackListPacks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['type'] = entity.type;
  data['languages'] = entity.languages;
  data['pictureQuality'] = entity.pictureQuality;
  data['prices'] = entity.prices?.map((v) => v.toJson()).toList();
  return data;
}

extension PackListPacksExtension on PackListPacks {
  PackListPacks copyWith({
    int? id,
    String? name,
    String? type,
    List<String>? languages,
    String? pictureQuality,
    List<PackListPacksPrices>? prices,
  }) {
    return PackListPacks()
      ..id = id ?? this.id
      ..name = name ?? this.name
      ..type = type ?? this.type
      ..languages = languages ?? this.languages
      ..pictureQuality = pictureQuality ?? this.pictureQuality
      ..prices = prices ?? this.prices;
  }
}

PackListPacksPrices $PackListPacksPricesFromJson(Map<String, dynamic> json) {
  final PackListPacksPrices packListPacksPrices = PackListPacksPrices();
  final int? amount = jsonConvert.convert<int>(json['amount']);
  if (amount != null) {
    packListPacksPrices.amount = amount;
  }
  final int? validityMonths = jsonConvert.convert<int>(json['validityMonths']);
  if (validityMonths != null) {
    packListPacksPrices.validityMonths = validityMonths;
  }
  final int? effectiveMonthlyPrice = jsonConvert.convert<int>(
      json['effectiveMonthlyPrice']);
  if (effectiveMonthlyPrice != null) {
    packListPacksPrices.effectiveMonthlyPrice = effectiveMonthlyPrice;
  }
  final String? validity = jsonConvert.convert<String>(json['validity']);
  if (validity != null) {
    packListPacksPrices.validity = validity;
  }
  final bool? ncf = jsonConvert.convert<bool>(json['ncf']);
  if (ncf != null) {
    packListPacksPrices.ncf = ncf;
  }
  final int? extraValidityDays = jsonConvert.convert<int>(
      json['extraValidityDays']);
  if (extraValidityDays != null) {
    packListPacksPrices.extraValidityDays = extraValidityDays;
  }
  return packListPacksPrices;
}

Map<String, dynamic> $PackListPacksPricesToJson(PackListPacksPrices entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['amount'] = entity.amount;
  data['validityMonths'] = entity.validityMonths;
  data['effectiveMonthlyPrice'] = entity.effectiveMonthlyPrice;
  data['validity'] = entity.validity;
  data['ncf'] = entity.ncf;
  data['extraValidityDays'] = entity.extraValidityDays;
  return data;
}

extension PackListPacksPricesExtension on PackListPacksPrices {
  PackListPacksPrices copyWith({
    int? amount,
    int? validityMonths,
    int? effectiveMonthlyPrice,
    String? validity,
    bool? ncf,
    int? extraValidityDays,
  }) {
    return PackListPacksPrices()
      ..amount = amount ?? this.amount
      ..validityMonths = validityMonths ?? this.validityMonths
      ..effectiveMonthlyPrice = effectiveMonthlyPrice ??
          this.effectiveMonthlyPrice
      ..validity = validity ?? this.validity
      ..ncf = ncf ?? this.ncf
      ..extraValidityDays = extraValidityDays ?? this.extraValidityDays;
  }
}