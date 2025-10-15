import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/cart_order_details_entity.dart';

CartOrderDetailsEntity $CartOrderDetailsEntityFromJson(
    Map<String, dynamic> json) {
  final CartOrderDetailsEntity cartOrderDetailsEntity = CartOrderDetailsEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    cartOrderDetailsEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    cartOrderDetailsEntity.message = message;
  }
  final List<CartOrderDetailsData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<CartOrderDetailsData>(e) as CartOrderDetailsData)
      .toList();
  if (data != null) {
    cartOrderDetailsEntity.data = data;
  }
  return cartOrderDetailsEntity;
}

Map<String, dynamic> $CartOrderDetailsEntityToJson(
    CartOrderDetailsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension CartOrderDetailsEntityExtension on CartOrderDetailsEntity {
  CartOrderDetailsEntity copyWith({
    int? status,
    String? message,
    List<CartOrderDetailsData>? data,
  }) {
    return CartOrderDetailsEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

CartOrderDetailsData $CartOrderDetailsDataFromJson(Map<String, dynamic> json) {
  final CartOrderDetailsData cartOrderDetailsData = CartOrderDetailsData();
  final String? cartOrderitemid = jsonConvert.convert<String>(
      json['cart_orderitemid']);
  if (cartOrderitemid != null) {
    cartOrderDetailsData.cartOrderitemid = cartOrderitemid;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    cartOrderDetailsData.id = id;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    cartOrderDetailsData.productId = productId;
  }
  final String? quantity = jsonConvert.convert<String>(json['quantity']);
  if (quantity != null) {
    cartOrderDetailsData.quantity = quantity;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    cartOrderDetailsData.price = price;
  }
  final String? stockid = jsonConvert.convert<String>(json['stockid']);
  if (stockid != null) {
    cartOrderDetailsData.stockid = stockid;
  }
  final String? netpayablecommission = jsonConvert.convert<String>(
      json['netpayablecommission']);
  if (netpayablecommission != null) {
    cartOrderDetailsData.netpayablecommission = netpayablecommission;
  }
  final String? sponsorCasback = jsonConvert.convert<String>(
      json['sponsor_casback']);
  if (sponsorCasback != null) {
    cartOrderDetailsData.sponsorCasback = sponsorCasback;
  }
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    cartOrderDetailsData.orderId = orderId;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    cartOrderDetailsData.status = status;
  }
  final dynamic statusUpdDate = json['status_upd_date'];
  if (statusUpdDate != null) {
    cartOrderDetailsData.statusUpdDate = statusUpdDate;
  }
  final String? orderItemStatus = jsonConvert.convert<String>(
      json['order_item_status']);
  if (orderItemStatus != null) {
    cartOrderDetailsData.orderItemStatus = orderItemStatus;
  }
  final String? itemPointsRedeemed = jsonConvert.convert<String>(
      json['item_points_redeemed']);
  if (itemPointsRedeemed != null) {
    cartOrderDetailsData.itemPointsRedeemed = itemPointsRedeemed;
  }
  final String? initiateConfirm = jsonConvert.convert<String>(
      json['initiate_confirm']);
  if (initiateConfirm != null) {
    cartOrderDetailsData.initiateConfirm = initiateConfirm;
  }
  final dynamic orderItemUpdDate = json['order_item_upd_date'];
  if (orderItemUpdDate != null) {
    cartOrderDetailsData.orderItemUpdDate = orderItemUpdDate;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    cartOrderDetailsData.userId = userId;
  }
  final dynamic updateBy = json['update_by'];
  if (updateBy != null) {
    cartOrderDetailsData.updateBy = updateBy;
  }
  final String? vendorConfirmationUpdatedBy = jsonConvert.convert<String>(
      json['vendor_confirmation_updated_by']);
  if (vendorConfirmationUpdatedBy != null) {
    cartOrderDetailsData.vendorConfirmationUpdatedBy =
        vendorConfirmationUpdatedBy;
  }
  final dynamic vendorConfirmationUpdatedAt = json['vendor_confirmation_updated_at'];
  if (vendorConfirmationUpdatedAt != null) {
    cartOrderDetailsData.vendorConfirmationUpdatedAt =
        vendorConfirmationUpdatedAt;
  }
  final dynamic packingEmpoyeeId = json['packing_empoyee_id'];
  if (packingEmpoyeeId != null) {
    cartOrderDetailsData.packingEmpoyeeId = packingEmpoyeeId;
  }
  final dynamic packedAt = json['packed_at'];
  if (packedAt != null) {
    cartOrderDetailsData.packedAt = packedAt;
  }
  final String? invoiceStatus = jsonConvert.convert<String>(
      json['invoice_status']);
  if (invoiceStatus != null) {
    cartOrderDetailsData.invoiceStatus = invoiceStatus;
  }
  final dynamic shippedEmpId = json['shipped_emp_id'];
  if (shippedEmpId != null) {
    cartOrderDetailsData.shippedEmpId = shippedEmpId;
  }
  final dynamic shippedAt = json['shipped_at'];
  if (shippedAt != null) {
    cartOrderDetailsData.shippedAt = shippedAt;
  }
  final dynamic deliveringAgencyId = json['delivering_agency_id'];
  if (deliveringAgencyId != null) {
    cartOrderDetailsData.deliveringAgencyId = deliveringAgencyId;
  }
  final dynamic podNumber = json['pod_number'];
  if (podNumber != null) {
    cartOrderDetailsData.podNumber = podNumber;
  }
  final String? podRate = jsonConvert.convert<String>(json['pod_rate']);
  if (podRate != null) {
    cartOrderDetailsData.podRate = podRate;
  }
  final String? deliveryStatusFromAgency = jsonConvert.convert<String>(
      json['delivery_status_from_agency']);
  if (deliveryStatusFromAgency != null) {
    cartOrderDetailsData.deliveryStatusFromAgency = deliveryStatusFromAgency;
  }
  final dynamic deliveryRecvedDateFromAgency = json['delivery_recved_date_from_agency'];
  if (deliveryRecvedDateFromAgency != null) {
    cartOrderDetailsData.deliveryRecvedDateFromAgency =
        deliveryRecvedDateFromAgency;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    cartOrderDetailsData.createdAt = createdAt;
  }
  final dynamic cancelledAt = json['cancelled_at'];
  if (cancelledAt != null) {
    cartOrderDetailsData.cancelledAt = cancelledAt;
  }
  final String? qtyUpdate = jsonConvert.convert<String>(json['qty_update']);
  if (qtyUpdate != null) {
    cartOrderDetailsData.qtyUpdate = qtyUpdate;
  }
  final String? paymentTest = jsonConvert.convert<String>(json['payment_test']);
  if (paymentTest != null) {
    cartOrderDetailsData.paymentTest = paymentTest;
  }
  final String? productName = jsonConvert.convert<String>(json['product_name']);
  if (productName != null) {
    cartOrderDetailsData.productName = productName;
  }
  final String? productCode = jsonConvert.convert<String>(json['product_code']);
  if (productCode != null) {
    cartOrderDetailsData.productCode = productCode;
  }
  final String? hsncode = jsonConvert.convert<String>(json['hsncode']);
  if (hsncode != null) {
    cartOrderDetailsData.hsncode = hsncode;
  }
  final String? categoryId = jsonConvert.convert<String>(json['category_id']);
  if (categoryId != null) {
    cartOrderDetailsData.categoryId = categoryId;
  }
  final String? subCategoryId = jsonConvert.convert<String>(
      json['sub_category_id']);
  if (subCategoryId != null) {
    cartOrderDetailsData.subCategoryId = subCategoryId;
  }
  final String? productDescription = jsonConvert.convert<String>(
      json['product_description']);
  if (productDescription != null) {
    cartOrderDetailsData.productDescription = productDescription;
  }
  final String? productSpec = jsonConvert.convert<String>(json['product_spec']);
  if (productSpec != null) {
    cartOrderDetailsData.productSpec = productSpec;
  }
  final String? primeImage = jsonConvert.convert<String>(json['prime_image']);
  if (primeImage != null) {
    cartOrderDetailsData.primeImage = primeImage;
  }
  final String? sideImage1 = jsonConvert.convert<String>(json['side_image1']);
  if (sideImage1 != null) {
    cartOrderDetailsData.sideImage1 = sideImage1;
  }
  final String? sideImage2 = jsonConvert.convert<String>(json['side_image2']);
  if (sideImage2 != null) {
    cartOrderDetailsData.sideImage2 = sideImage2;
  }
  final dynamic sideImage3 = json['side_image3'];
  if (sideImage3 != null) {
    cartOrderDetailsData.sideImage3 = sideImage3;
  }
  final dynamic sideImage4 = json['side_image4'];
  if (sideImage4 != null) {
    cartOrderDetailsData.sideImage4 = sideImage4;
  }
  final String? unitId = jsonConvert.convert<String>(json['unit_id']);
  if (unitId != null) {
    cartOrderDetailsData.unitId = unitId;
  }
  final String? sizeEnabled = jsonConvert.convert<String>(json['size_enabled']);
  if (sizeEnabled != null) {
    cartOrderDetailsData.sizeEnabled = sizeEnabled;
  }
  final String? colorEnabled = jsonConvert.convert<String>(
      json['color_enabled']);
  if (colorEnabled != null) {
    cartOrderDetailsData.colorEnabled = colorEnabled;
  }
  final String? color = jsonConvert.convert<String>(json['color']);
  if (color != null) {
    cartOrderDetailsData.color = color;
  }
  final String? size = jsonConvert.convert<String>(json['size']);
  if (size != null) {
    cartOrderDetailsData.size = size;
  }
  final String? vendorId = jsonConvert.convert<String>(json['vendor_id']);
  if (vendorId != null) {
    cartOrderDetailsData.vendorId = vendorId;
  }
  final String? returnPolicyId = jsonConvert.convert<String>(
      json['return_policy_id']);
  if (returnPolicyId != null) {
    cartOrderDetailsData.returnPolicyId = returnPolicyId;
  }
  final String? offeredItemStatus = jsonConvert.convert<String>(
      json['offered_item_status']);
  if (offeredItemStatus != null) {
    cartOrderDetailsData.offeredItemStatus = offeredItemStatus;
  }
  final String? returnable = jsonConvert.convert<String>(json['returnable']);
  if (returnable != null) {
    cartOrderDetailsData.returnable = returnable;
  }
  final String? returnDays = jsonConvert.convert<String>(json['return_days']);
  if (returnDays != null) {
    cartOrderDetailsData.returnDays = returnDays;
  }
  final String? upd = jsonConvert.convert<String>(json['upd']);
  if (upd != null) {
    cartOrderDetailsData.upd = upd;
  }
  final dynamic dType = json['d_type'];
  if (dType != null) {
    cartOrderDetailsData.dType = dType;
  }
  final dynamic proidFrom = json['proid_from'];
  if (proidFrom != null) {
    cartOrderDetailsData.proidFrom = proidFrom;
  }
  final dynamic sz = json['sz'];
  if (sz != null) {
    cartOrderDetailsData.sz = sz;
  }
  final String? currentQty = jsonConvert.convert<String>(json['current_qty']);
  if (currentQty != null) {
    cartOrderDetailsData.currentQty = currentQty;
  }
  final String? priceStock = jsonConvert.convert<String>(json['price_stock']);
  if (priceStock != null) {
    cartOrderDetailsData.priceStock = priceStock;
  }
  final String? mrp = jsonConvert.convert<String>(json['mrp']);
  if (mrp != null) {
    cartOrderDetailsData.mrp = mrp;
  }
  final String? savecartPrice = jsonConvert.convert<String>(
      json['savecart_price']);
  if (savecartPrice != null) {
    cartOrderDetailsData.savecartPrice = savecartPrice;
  }
  final String? ppRedemption = jsonConvert.convert<String>(
      json['pp_redemption']);
  if (ppRedemption != null) {
    cartOrderDetailsData.ppRedemption = ppRedemption;
  }
  final String? priceSales = jsonConvert.convert<String>(json['price_sales']);
  if (priceSales != null) {
    cartOrderDetailsData.priceSales = priceSales;
  }
  final String? igst = jsonConvert.convert<String>(json['igst']);
  if (igst != null) {
    cartOrderDetailsData.igst = igst;
  }
  final String? sgst = jsonConvert.convert<String>(json['sgst']);
  if (sgst != null) {
    cartOrderDetailsData.sgst = sgst;
  }
  final String? csgt = jsonConvert.convert<String>(json['csgt']);
  if (csgt != null) {
    cartOrderDetailsData.csgt = csgt;
  }
  final String? igstAmt = jsonConvert.convert<String>(json['igst_amt']);
  if (igstAmt != null) {
    cartOrderDetailsData.igstAmt = igstAmt;
  }
  final String? sgstAmt = jsonConvert.convert<String>(json['sgst_amt']);
  if (sgstAmt != null) {
    cartOrderDetailsData.sgstAmt = sgstAmt;
  }
  final String? cgstAmt = jsonConvert.convert<String>(json['cgst_amt']);
  if (cgstAmt != null) {
    cartOrderDetailsData.cgstAmt = cgstAmt;
  }
  final String? priceWithoutGst = jsonConvert.convert<String>(
      json['price_without_gst']);
  if (priceWithoutGst != null) {
    cartOrderDetailsData.priceWithoutGst = priceWithoutGst;
  }
  final String? margin = jsonConvert.convert<String>(json['margin']);
  if (margin != null) {
    cartOrderDetailsData.margin = margin;
  }
  final String? genShareAmt = jsonConvert.convert<String>(
      json['gen_share_amt']);
  if (genShareAmt != null) {
    cartOrderDetailsData.genShareAmt = genShareAmt;
  }
  final String? cashBack = jsonConvert.convert<String>(json['cash_back']);
  if (cashBack != null) {
    cartOrderDetailsData.cashBack = cashBack;
  }
  final String? stockEntryDate = jsonConvert.convert<String>(
      json['stock_entry_date']);
  if (stockEntryDate != null) {
    cartOrderDetailsData.stockEntryDate = stockEntryDate;
  }
  final String? addressid = jsonConvert.convert<String>(json['addressid']);
  if (addressid != null) {
    cartOrderDetailsData.addressid = addressid;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    cartOrderDetailsData.name = name;
  }
  final String? housename = jsonConvert.convert<String>(json['housename']);
  if (housename != null) {
    cartOrderDetailsData.housename = housename;
  }
  final String? flatno = jsonConvert.convert<String>(json['flatno']);
  if (flatno != null) {
    cartOrderDetailsData.flatno = flatno;
  }
  final String? landmark = jsonConvert.convert<String>(json['landmark']);
  if (landmark != null) {
    cartOrderDetailsData.landmark = landmark;
  }
  final String? place = jsonConvert.convert<String>(json['place']);
  if (place != null) {
    cartOrderDetailsData.place = place;
  }
  final String? district = jsonConvert.convert<String>(json['district']);
  if (district != null) {
    cartOrderDetailsData.district = district;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    cartOrderDetailsData.phone = phone;
  }
  final String? pincode = jsonConvert.convert<String>(json['pincode']);
  if (pincode != null) {
    cartOrderDetailsData.pincode = pincode;
  }
  final String? state = jsonConvert.convert<String>(json['state']);
  if (state != null) {
    cartOrderDetailsData.state = state;
  }
  final String? country = jsonConvert.convert<String>(json['country']);
  if (country != null) {
    cartOrderDetailsData.country = country;
  }
  final String? orderid = jsonConvert.convert<String>(json['orderid']);
  if (orderid != null) {
    cartOrderDetailsData.orderid = orderid;
  }
  return cartOrderDetailsData;
}

Map<String, dynamic> $CartOrderDetailsDataToJson(CartOrderDetailsData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cart_orderitemid'] = entity.cartOrderitemid;
  data['id'] = entity.id;
  data['product_id'] = entity.productId;
  data['quantity'] = entity.quantity;
  data['price'] = entity.price;
  data['stockid'] = entity.stockid;
  data['netpayablecommission'] = entity.netpayablecommission;
  data['sponsor_casback'] = entity.sponsorCasback;
  data['order_id'] = entity.orderId;
  data['status'] = entity.status;
  data['status_upd_date'] = entity.statusUpdDate;
  data['order_item_status'] = entity.orderItemStatus;
  data['item_points_redeemed'] = entity.itemPointsRedeemed;
  data['initiate_confirm'] = entity.initiateConfirm;
  data['order_item_upd_date'] = entity.orderItemUpdDate;
  data['user_id'] = entity.userId;
  data['update_by'] = entity.updateBy;
  data['vendor_confirmation_updated_by'] = entity.vendorConfirmationUpdatedBy;
  data['vendor_confirmation_updated_at'] = entity.vendorConfirmationUpdatedAt;
  data['packing_empoyee_id'] = entity.packingEmpoyeeId;
  data['packed_at'] = entity.packedAt;
  data['invoice_status'] = entity.invoiceStatus;
  data['shipped_emp_id'] = entity.shippedEmpId;
  data['shipped_at'] = entity.shippedAt;
  data['delivering_agency_id'] = entity.deliveringAgencyId;
  data['pod_number'] = entity.podNumber;
  data['pod_rate'] = entity.podRate;
  data['delivery_status_from_agency'] = entity.deliveryStatusFromAgency;
  data['delivery_recved_date_from_agency'] =
      entity.deliveryRecvedDateFromAgency;
  data['created_at'] = entity.createdAt;
  data['cancelled_at'] = entity.cancelledAt;
  data['qty_update'] = entity.qtyUpdate;
  data['payment_test'] = entity.paymentTest;
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
  data['returnable'] = entity.returnable;
  data['return_days'] = entity.returnDays;
  data['upd'] = entity.upd;
  data['d_type'] = entity.dType;
  data['proid_from'] = entity.proidFrom;
  data['sz'] = entity.sz;
  data['current_qty'] = entity.currentQty;
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
  data['addressid'] = entity.addressid;
  data['name'] = entity.name;
  data['housename'] = entity.housename;
  data['flatno'] = entity.flatno;
  data['landmark'] = entity.landmark;
  data['place'] = entity.place;
  data['district'] = entity.district;
  data['phone'] = entity.phone;
  data['pincode'] = entity.pincode;
  data['state'] = entity.state;
  data['country'] = entity.country;
  data['orderid'] = entity.orderid;
  return data;
}

extension CartOrderDetailsDataExtension on CartOrderDetailsData {
  CartOrderDetailsData copyWith({
    String? cartOrderitemid,
    String? id,
    String? productId,
    String? quantity,
    String? price,
    String? stockid,
    String? netpayablecommission,
    String? sponsorCasback,
    String? orderId,
    String? status,
    dynamic statusUpdDate,
    String? orderItemStatus,
    String? itemPointsRedeemed,
    String? initiateConfirm,
    dynamic orderItemUpdDate,
    String? userId,
    dynamic updateBy,
    String? vendorConfirmationUpdatedBy,
    dynamic vendorConfirmationUpdatedAt,
    dynamic packingEmpoyeeId,
    dynamic packedAt,
    String? invoiceStatus,
    dynamic shippedEmpId,
    dynamic shippedAt,
    dynamic deliveringAgencyId,
    dynamic podNumber,
    String? podRate,
    String? deliveryStatusFromAgency,
    dynamic deliveryRecvedDateFromAgency,
    String? createdAt,
    dynamic cancelledAt,
    String? qtyUpdate,
    String? paymentTest,
    String? productName,
    String? productCode,
    String? hsncode,
    String? categoryId,
    String? subCategoryId,
    String? productDescription,
    String? productSpec,
    String? primeImage,
    String? sideImage1,
    String? sideImage2,
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
    String? returnable,
    String? returnDays,
    String? upd,
    dynamic dType,
    dynamic proidFrom,
    dynamic sz,
    String? currentQty,
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
    String? addressid,
    String? name,
    String? housename,
    String? flatno,
    String? landmark,
    String? place,
    String? district,
    String? phone,
    String? pincode,
    String? state,
    String? country,
    String? orderid,
  }) {
    return CartOrderDetailsData()
      ..cartOrderitemid = cartOrderitemid ?? this.cartOrderitemid
      ..id = id ?? this.id
      ..productId = productId ?? this.productId
      ..quantity = quantity ?? this.quantity
      ..price = price ?? this.price
      ..stockid = stockid ?? this.stockid
      ..netpayablecommission = netpayablecommission ?? this.netpayablecommission
      ..sponsorCasback = sponsorCasback ?? this.sponsorCasback
      ..orderId = orderId ?? this.orderId
      ..status = status ?? this.status
      ..statusUpdDate = statusUpdDate ?? this.statusUpdDate
      ..orderItemStatus = orderItemStatus ?? this.orderItemStatus
      ..itemPointsRedeemed = itemPointsRedeemed ?? this.itemPointsRedeemed
      ..initiateConfirm = initiateConfirm ?? this.initiateConfirm
      ..orderItemUpdDate = orderItemUpdDate ?? this.orderItemUpdDate
      ..userId = userId ?? this.userId
      ..updateBy = updateBy ?? this.updateBy
      ..vendorConfirmationUpdatedBy = vendorConfirmationUpdatedBy ??
          this.vendorConfirmationUpdatedBy
      ..vendorConfirmationUpdatedAt = vendorConfirmationUpdatedAt ??
          this.vendorConfirmationUpdatedAt
      ..packingEmpoyeeId = packingEmpoyeeId ?? this.packingEmpoyeeId
      ..packedAt = packedAt ?? this.packedAt
      ..invoiceStatus = invoiceStatus ?? this.invoiceStatus
      ..shippedEmpId = shippedEmpId ?? this.shippedEmpId
      ..shippedAt = shippedAt ?? this.shippedAt
      ..deliveringAgencyId = deliveringAgencyId ?? this.deliveringAgencyId
      ..podNumber = podNumber ?? this.podNumber
      ..podRate = podRate ?? this.podRate
      ..deliveryStatusFromAgency = deliveryStatusFromAgency ??
          this.deliveryStatusFromAgency
      ..deliveryRecvedDateFromAgency = deliveryRecvedDateFromAgency ??
          this.deliveryRecvedDateFromAgency
      ..createdAt = createdAt ?? this.createdAt
      ..cancelledAt = cancelledAt ?? this.cancelledAt
      ..qtyUpdate = qtyUpdate ?? this.qtyUpdate
      ..paymentTest = paymentTest ?? this.paymentTest
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
      ..returnable = returnable ?? this.returnable
      ..returnDays = returnDays ?? this.returnDays
      ..upd = upd ?? this.upd
      ..dType = dType ?? this.dType
      ..proidFrom = proidFrom ?? this.proidFrom
      ..sz = sz ?? this.sz
      ..currentQty = currentQty ?? this.currentQty
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
      ..stockEntryDate = stockEntryDate ?? this.stockEntryDate
      ..addressid = addressid ?? this.addressid
      ..name = name ?? this.name
      ..housename = housename ?? this.housename
      ..flatno = flatno ?? this.flatno
      ..landmark = landmark ?? this.landmark
      ..place = place ?? this.place
      ..district = district ?? this.district
      ..phone = phone ?? this.phone
      ..pincode = pincode ?? this.pincode
      ..state = state ?? this.state
      ..country = country ?? this.country
      ..orderid = orderid ?? this.orderid;
  }
}