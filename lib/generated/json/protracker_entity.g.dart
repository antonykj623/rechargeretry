import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/protracker_entity.dart';

ProtrackerEntity $ProtrackerEntityFromJson(Map<String, dynamic> json) {
  final ProtrackerEntity protrackerEntity = ProtrackerEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    protrackerEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    protrackerEntity.message = message;
  }
  final ProtrackerData? data = jsonConvert.convert<ProtrackerData>(
      json['data']);
  if (data != null) {
    protrackerEntity.data = data;
  }
  return protrackerEntity;
}

Map<String, dynamic> $ProtrackerEntityToJson(ProtrackerEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.toJson();
  return data;
}

extension ProtrackerEntityExtension on ProtrackerEntity {
  ProtrackerEntity copyWith({
    int? status,
    String? message,
    ProtrackerData? data,
  }) {
    return ProtrackerEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

ProtrackerData $ProtrackerDataFromJson(Map<String, dynamic> json) {
  final ProtrackerData protrackerData = ProtrackerData();
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    protrackerData.productId = productId;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    protrackerData.id = id;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    protrackerData.productName = productName;
  }
  final String? productCode = jsonConvert.convert<String>(json['product_code']);
  if (productCode != null) {
    protrackerData.productCode = productCode;
  }
  final String? hsncode = jsonConvert.convert<String>(json['hsncode']);
  if (hsncode != null) {
    protrackerData.hsncode = hsncode;
  }
  final String? categoryId = jsonConvert.convert<String>(json['category_id']);
  if (categoryId != null) {
    protrackerData.categoryId = categoryId;
  }
  final String? subCategoryId = jsonConvert.convert<String>(
      json['sub_category_id']);
  if (subCategoryId != null) {
    protrackerData.subCategoryId = subCategoryId;
  }
  final String? productDescription = jsonConvert.convert<String>(
      json['product_description']);
  if (productDescription != null) {
    protrackerData.productDescription = productDescription;
  }
  final String? productSpec = jsonConvert.convert<String>(json['product_spec']);
  if (productSpec != null) {
    protrackerData.productSpec = productSpec;
  }
  final String? primeImage = jsonConvert.convert<String>(json['prime_image']);
  if (primeImage != null) {
    protrackerData.primeImage = primeImage;
  }
  final dynamic sideImage1 = json['side_image1'];
  if (sideImage1 != null) {
    protrackerData.sideImage1 = sideImage1;
  }
  final dynamic sideImage2 = json['side_image2'];
  if (sideImage2 != null) {
    protrackerData.sideImage2 = sideImage2;
  }
  final dynamic sideImage3 = json['side_image3'];
  if (sideImage3 != null) {
    protrackerData.sideImage3 = sideImage3;
  }
  final dynamic sideImage4 = json['side_image4'];
  if (sideImage4 != null) {
    protrackerData.sideImage4 = sideImage4;
  }
  final String? unitId = jsonConvert.convert<String>(json['unit_id']);
  if (unitId != null) {
    protrackerData.unitId = unitId;
  }
  final String? sizeEnabled = jsonConvert.convert<String>(json['size_enabled']);
  if (sizeEnabled != null) {
    protrackerData.sizeEnabled = sizeEnabled;
  }
  final String? colorEnabled = jsonConvert.convert<String>(
      json['color_enabled']);
  if (colorEnabled != null) {
    protrackerData.colorEnabled = colorEnabled;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    protrackerData.color = color;
  }
  final String? size = jsonConvert.convert<String>(json['size']);
  if (size != null) {
    protrackerData.size = size;
  }
  final String? vendorId = jsonConvert.convert<String>(json['vendor_id']);
  if (vendorId != null) {
    protrackerData.vendorId = vendorId;
  }
  final String? returnPolicyId = jsonConvert.convert<String>(
      json['return_policy_id']);
  if (returnPolicyId != null) {
    protrackerData.returnPolicyId = returnPolicyId;
  }
  final String? offeredItemStatus = jsonConvert.convert<String>(
      json['offered_item_status']);
  if (offeredItemStatus != null) {
    protrackerData.offeredItemStatus = offeredItemStatus;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    protrackerData.status = status;
  }
  final String? returnable = jsonConvert.convert<String>(json['returnable']);
  if (returnable != null) {
    protrackerData.returnable = returnable;
  }
  final String? returnDays = jsonConvert.convert<String>(json['return_days']);
  if (returnDays != null) {
    protrackerData.returnDays = returnDays;
  }
  final String? upd = jsonConvert.convert<String>(json['upd']);
  if (upd != null) {
    protrackerData.upd = upd;
  }
  final String? stockid = jsonConvert.convert<String>(json['stockid']);
  if (stockid != null) {
    protrackerData.stockid = stockid;
  }
  final dynamic dType = json['d_type'];
  if (dType != null) {
    protrackerData.dType = dType;
  }
  final dynamic proidFrom = json['proid_from'];
  if (proidFrom != null) {
    protrackerData.proidFrom = proidFrom;
  }
  final dynamic sz = json['sz'];
  if (sz != null) {
    protrackerData.sz = sz;
  }
  final String? currentQty = jsonConvert.convert<String>(json['current_qty']);
  if (currentQty != null) {
    protrackerData.currentQty = currentQty;
  }
  final String? lastInputQty = jsonConvert.convert<String>(
      json['last_input_qty']);
  if (lastInputQty != null) {
    protrackerData.lastInputQty = lastInputQty;
  }
  final String? priceStock = jsonConvert.convert<String>(json['price_stock']);
  if (priceStock != null) {
    protrackerData.priceStock = priceStock;
  }
  final String? mrp = jsonConvert.convert<String>(json['mrp']);
  if (mrp != null) {
    protrackerData.mrp = mrp;
  }
  final String? savecartPrice = jsonConvert.convert<String>(
      json['savecart_price']);
  if (savecartPrice != null) {
    protrackerData.savecartPrice = savecartPrice;
  }
  final String? ppRedemption = jsonConvert.convert<String>(
      json['pp_redemption']);
  if (ppRedemption != null) {
    protrackerData.ppRedemption = ppRedemption;
  }
  final String? priceSales = jsonConvert.convert<String>(json['price_sales']);
  if (priceSales != null) {
    protrackerData.priceSales = priceSales;
  }
  final String? igst = jsonConvert.convert<String>(json['igst']);
  if (igst != null) {
    protrackerData.igst = igst;
  }
  final String? sgst = jsonConvert.convert<String>(json['sgst']);
  if (sgst != null) {
    protrackerData.sgst = sgst;
  }
  final String? csgt = jsonConvert.convert<String>(json['csgt']);
  if (csgt != null) {
    protrackerData.csgt = csgt;
  }
  final String? igstAmt = jsonConvert.convert<String>(json['igst_amt']);
  if (igstAmt != null) {
    protrackerData.igstAmt = igstAmt;
  }
  final String? sgstAmt = jsonConvert.convert<String>(json['sgst_amt']);
  if (sgstAmt != null) {
    protrackerData.sgstAmt = sgstAmt;
  }
  final String? cgstAmt = jsonConvert.convert<String>(json['cgst_amt']);
  if (cgstAmt != null) {
    protrackerData.cgstAmt = cgstAmt;
  }
  final String? priceWithoutGst = jsonConvert.convert<String>(
      json['price_without_gst']);
  if (priceWithoutGst != null) {
    protrackerData.priceWithoutGst = priceWithoutGst;
  }
  final String? margin = jsonConvert.convert<String>(json['margin']);
  if (margin != null) {
    protrackerData.margin = margin;
  }
  final String? genShareAmt = jsonConvert.convert<String>(
      json['gen_share_amt']);
  if (genShareAmt != null) {
    protrackerData.genShareAmt = genShareAmt;
  }
  final String? cashBack = jsonConvert.convert<String>(json['cash_back']);
  if (cashBack != null) {
    protrackerData.cashBack = cashBack;
  }
  final String? stockEntryDate = jsonConvert.convert<String>(
      json['stock_entry_date']);
  if (stockEntryDate != null) {
    protrackerData.stockEntryDate = stockEntryDate;
  }
  return protrackerData;
}

Map<String, dynamic> $ProtrackerDataToJson(ProtrackerData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['product_id'] = entity.productId;
  data['id'] = entity.id;
  data['product_name'] = entity.productName;
  data['product_code'] = entity.productCode;
  data['hsncode'] = entity.hsncode;
  data['category_id'] = entity.categoryId;
  data['sub_category_id'] = entity.subCategoryId;
  data['product_description'] = entity.productDescription;
  data['product_spec'] = entity.productSpec;
  data['prime_image'] = entity.primeImage;
  data['side_image1'] = entity.sideImage1;
  data['side_image2'] = entity.sideImage2;
  data['side_image3'] = entity.sideImage3;
  data['side_image4'] = entity.sideImage4;
  data['unit_id'] = entity.unitId;
  data['size_enabled'] = entity.sizeEnabled;
  data['color_enabled'] = entity.colorEnabled;
  data['color'] = entity.color;
  data['size'] = entity.size;
  data['vendor_id'] = entity.vendorId;
  data['return_policy_id'] = entity.returnPolicyId;
  data['offered_item_status'] = entity.offeredItemStatus;
  data['status'] = entity.status;
  data['returnable'] = entity.returnable;
  data['return_days'] = entity.returnDays;
  data['upd'] = entity.upd;
  data['stockid'] = entity.stockid;
  data['d_type'] = entity.dType;
  data['proid_from'] = entity.proidFrom;
  data['sz'] = entity.sz;
  data['current_qty'] = entity.currentQty;
  data['last_input_qty'] = entity.lastInputQty;
  data['price_stock'] = entity.priceStock;
  data['mrp'] = entity.mrp;
  data['savecart_price'] = entity.savecartPrice;
  data['pp_redemption'] = entity.ppRedemption;
  data['price_sales'] = entity.priceSales;
  data['igst'] = entity.igst;
  data['sgst'] = entity.sgst;
  data['csgt'] = entity.csgt;
  data['igst_amt'] = entity.igstAmt;
  data['sgst_amt'] = entity.sgstAmt;
  data['cgst_amt'] = entity.cgstAmt;
  data['price_without_gst'] = entity.priceWithoutGst;
  data['margin'] = entity.margin;
  data['gen_share_amt'] = entity.genShareAmt;
  data['cash_back'] = entity.cashBack;
  data['stock_entry_date'] = entity.stockEntryDate;
  return data;
}

extension ProtrackerDataExtension on ProtrackerData {
  ProtrackerData copyWith({
    String? productId,
    String? id,
    String? productName,
    String? productCode,
    String? hsncode,
    String? categoryId,
    String? subCategoryId,
    String? productDescription,
    String? productSpec,
    String? primeImage,
    dynamic sideImage1,
    dynamic sideImage2,
    dynamic sideImage3,
    dynamic sideImage4,
    String? unitId,
    String? sizeEnabled,
    String? colorEnabled,
    String? color,
    String? size,
    String? vendorId,
    String? returnPolicyId,
    String? offeredItemStatus,
    String? status,
    String? returnable,
    String? returnDays,
    String? upd,
    String? stockid,
    dynamic dType,
    dynamic proidFrom,
    dynamic sz,
    String? currentQty,
    String? lastInputQty,
    String? priceStock,
    String? mrp,
    String? savecartPrice,
    String? ppRedemption,
    String? priceSales,
    String? igst,
    String? sgst,
    String? csgt,
    String? igstAmt,
    String? sgstAmt,
    String? cgstAmt,
    String? priceWithoutGst,
    String? margin,
    String? genShareAmt,
    String? cashBack,
    String? stockEntryDate,
  }) {
    return ProtrackerData()
      ..productId = productId ?? this.productId
      ..id = id ?? this.id
      ..productName = productName ?? this.productName
      ..productCode = productCode ?? this.productCode
      ..hsncode = hsncode ?? this.hsncode
      ..categoryId = categoryId ?? this.categoryId
      ..subCategoryId = subCategoryId ?? this.subCategoryId
      ..productDescription = productDescription ?? this.productDescription
      ..productSpec = productSpec ?? this.productSpec
      ..primeImage = primeImage ?? this.primeImage
      ..sideImage1 = sideImage1 ?? this.sideImage1
      ..sideImage2 = sideImage2 ?? this.sideImage2
      ..sideImage3 = sideImage3 ?? this.sideImage3
      ..sideImage4 = sideImage4 ?? this.sideImage4
      ..unitId = unitId ?? this.unitId
      ..sizeEnabled = sizeEnabled ?? this.sizeEnabled
      ..colorEnabled = colorEnabled ?? this.colorEnabled
      ..color = color ?? this.color
      ..size = size ?? this.size
      ..vendorId = vendorId ?? this.vendorId
      ..returnPolicyId = returnPolicyId ?? this.returnPolicyId
      ..offeredItemStatus = offeredItemStatus ?? this.offeredItemStatus
      ..status = status ?? this.status
      ..returnable = returnable ?? this.returnable
      ..returnDays = returnDays ?? this.returnDays
      ..upd = upd ?? this.upd
      ..stockid = stockid ?? this.stockid
      ..dType = dType ?? this.dType
      ..proidFrom = proidFrom ?? this.proidFrom
      ..sz = sz ?? this.sz
      ..currentQty = currentQty ?? this.currentQty
      ..lastInputQty = lastInputQty ?? this.lastInputQty
      ..priceStock = priceStock ?? this.priceStock
      ..mrp = mrp ?? this.mrp
      ..savecartPrice = savecartPrice ?? this.savecartPrice
      ..ppRedemption = ppRedemption ?? this.ppRedemption
      ..priceSales = priceSales ?? this.priceSales
      ..igst = igst ?? this.igst
      ..sgst = sgst ?? this.sgst
      ..csgt = csgt ?? this.csgt
      ..igstAmt = igstAmt ?? this.igstAmt
      ..sgstAmt = sgstAmt ?? this.sgstAmt
      ..cgstAmt = cgstAmt ?? this.cgstAmt
      ..priceWithoutGst = priceWithoutGst ?? this.priceWithoutGst
      ..margin = margin ?? this.margin
      ..genShareAmt = genShareAmt ?? this.genShareAmt
      ..cashBack = cashBack ?? this.cashBack
      ..stockEntryDate = stockEntryDate ?? this.stockEntryDate;
  }
}