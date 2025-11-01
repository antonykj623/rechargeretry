import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/cart_order_entity.dart';

CartOrderEntity $CartOrderEntityFromJson(Map<String, dynamic> json) {
  final CartOrderEntity cartOrderEntity = CartOrderEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    cartOrderEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    cartOrderEntity.message = message;
  }
  final List<CartOrderData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<CartOrderData>(e) as CartOrderData)
      .toList();
  if (data != null) {
    cartOrderEntity.data = data;
  }
  return cartOrderEntity;
}

Map<String, dynamic> $CartOrderEntityToJson(CartOrderEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension CartOrderEntityExtension on CartOrderEntity {
  CartOrderEntity copyWith({
    int? status,
    String? message,
    List<CartOrderData>? data,
  }) {
    return CartOrderEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

CartOrderData $CartOrderDataFromJson(Map<String, dynamic> json) {
  final CartOrderData cartOrderData = CartOrderData();
  final CartOrderDataOrderdata? orderdata = jsonConvert.convert<
      CartOrderDataOrderdata>(json['orderdata']);
  if (orderdata != null) {
    cartOrderData.orderdata = orderdata;
  }
  final List<
      CartOrderDataOrderitemdata>? orderitemdata = (json['orderitemdata'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<CartOrderDataOrderitemdata>(
          e) as CartOrderDataOrderitemdata).toList();
  if (orderitemdata != null) {
    cartOrderData.orderitemdata = orderitemdata;
  }
  return cartOrderData;
}

Map<String, dynamic> $CartOrderDataToJson(CartOrderData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['orderdata'] = entity.orderdata?.toJson();
  data['orderitemdata'] = entity.orderitemdata?.map((v) => v.toJson()).toList();
  return data;
}

extension CartOrderDataExtension on CartOrderData {
  CartOrderData copyWith({
    CartOrderDataOrderdata? orderdata,
    List<CartOrderDataOrderitemdata>? orderitemdata,
  }) {
    return CartOrderData()
      ..orderdata = orderdata ?? this.orderdata
      ..orderitemdata = orderitemdata ?? this.orderitemdata;
  }
}

CartOrderDataOrderdata $CartOrderDataOrderdataFromJson(
    Map<String, dynamic> json) {
  final CartOrderDataOrderdata cartOrderDataOrderdata = CartOrderDataOrderdata();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    cartOrderDataOrderdata.id = id;
  }
  final String? retriedOrderItemId = jsonConvert.convert<String>(
      json['retried_order_item_id']);
  if (retriedOrderItemId != null) {
    cartOrderDataOrderdata.retriedOrderItemId = retriedOrderItemId;
  }
  final String? regId = jsonConvert.convert<String>(json['reg_id']);
  if (regId != null) {
    cartOrderDataOrderdata.regId = regId;
  }
  final String? dateOrder = jsonConvert.convert<String>(json['date_order']);
  if (dateOrder != null) {
    cartOrderDataOrderdata.dateOrder = dateOrder;
  }
  final dynamic deliveryDate = json['delivery_date'];
  if (deliveryDate != null) {
    cartOrderDataOrderdata.deliveryDate = deliveryDate;
  }
  final String? addressId = jsonConvert.convert<String>(json['address_id']);
  if (addressId != null) {
    cartOrderDataOrderdata.addressId = addressId;
  }
  final String? totalprice = jsonConvert.convert<String>(json['totalprice']);
  if (totalprice != null) {
    cartOrderDataOrderdata.totalprice = totalprice;
  }
  final String? isWalletUsed = jsonConvert.convert<String>(
      json['isWalletUsed']);
  if (isWalletUsed != null) {
    cartOrderDataOrderdata.isWalletUsed = isWalletUsed;
  }
  final String? paidAmount = jsonConvert.convert<String>(json['paid_amount']);
  if (paidAmount != null) {
    cartOrderDataOrderdata.paidAmount = paidAmount;
  }
  final String? usedWalletAmount = jsonConvert.convert<String>(
      json['used_wallet_amount']);
  if (usedWalletAmount != null) {
    cartOrderDataOrderdata.usedWalletAmount = usedWalletAmount;
  }
  final String? paymentType = jsonConvert.convert<String>(json['payment_type']);
  if (paymentType != null) {
    cartOrderDataOrderdata.paymentType = paymentType;
  }
  final String? transactionId = jsonConvert.convert<String>(
      json['transaction_id']);
  if (transactionId != null) {
    cartOrderDataOrderdata.transactionId = transactionId;
  }
  final String? transactionDetails = jsonConvert.convert<String>(
      json['transaction_details']);
  if (transactionDetails != null) {
    cartOrderDataOrderdata.transactionDetails = transactionDetails;
  }
  final String? billingStatus = jsonConvert.convert<String>(
      json['billing_status']);
  if (billingStatus != null) {
    cartOrderDataOrderdata.billingStatus = billingStatus;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    cartOrderDataOrderdata.description = description;
  }
  final String? paymentStatus = jsonConvert.convert<String>(
      json['payment_status']);
  if (paymentStatus != null) {
    cartOrderDataOrderdata.paymentStatus = paymentStatus;
  }
  final String? initiateConfirm = jsonConvert.convert<String>(
      json['initiate_confirm']);
  if (initiateConfirm != null) {
    cartOrderDataOrderdata.initiateConfirm = initiateConfirm;
  }
  final String? fullName = jsonConvert.convert<String>(json['full_name']);
  if (fullName != null) {
    cartOrderDataOrderdata.fullName = fullName;
  }
  final String? registeredOb = jsonConvert.convert<String>(
      json['registered_ob']);
  if (registeredOb != null) {
    cartOrderDataOrderdata.registeredOb = registeredOb;
  }
  final String? emailId = jsonConvert.convert<String>(json['email_id']);
  if (emailId != null) {
    cartOrderDataOrderdata.emailId = emailId;
  }
  return cartOrderDataOrderdata;
}

Map<String, dynamic> $CartOrderDataOrderdataToJson(
    CartOrderDataOrderdata entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['retried_order_item_id'] = entity.retriedOrderItemId;
  data['reg_id'] = entity.regId;
  data['date_order'] = entity.dateOrder;
  data['delivery_date'] = entity.deliveryDate;
  data['address_id'] = entity.addressId;
  data['totalprice'] = entity.totalprice;
  data['isWalletUsed'] = entity.isWalletUsed;
  data['paid_amount'] = entity.paidAmount;
  data['used_wallet_amount'] = entity.usedWalletAmount;
  data['payment_type'] = entity.paymentType;
  data['transaction_id'] = entity.transactionId;
  data['transaction_details'] = entity.transactionDetails;
  data['billing_status'] = entity.billingStatus;
  data['description'] = entity.description;
  data['payment_status'] = entity.paymentStatus;
  data['initiate_confirm'] = entity.initiateConfirm;
  data['full_name'] = entity.fullName;
  data['registered_ob'] = entity.registeredOb;
  data['email_id'] = entity.emailId;
  return data;
}

extension CartOrderDataOrderdataExtension on CartOrderDataOrderdata {
  CartOrderDataOrderdata copyWith({
    String? id,
    String? retriedOrderItemId,
    String? regId,
    String? dateOrder,
    dynamic deliveryDate,
    String? addressId,
    String? totalprice,
    String? isWalletUsed,
    String? paidAmount,
    String? usedWalletAmount,
    String? paymentType,
    String? transactionId,
    String? transactionDetails,
    String? billingStatus,
    String? description,
    String? paymentStatus,
    String? initiateConfirm,
    String? fullName,
    String? registeredOb,
    String? emailId,
  }) {
    return CartOrderDataOrderdata()
      ..id = id ?? this.id
      ..retriedOrderItemId = retriedOrderItemId ?? this.retriedOrderItemId
      ..regId = regId ?? this.regId
      ..dateOrder = dateOrder ?? this.dateOrder
      ..deliveryDate = deliveryDate ?? this.deliveryDate
      ..addressId = addressId ?? this.addressId
      ..totalprice = totalprice ?? this.totalprice
      ..isWalletUsed = isWalletUsed ?? this.isWalletUsed
      ..paidAmount = paidAmount ?? this.paidAmount
      ..usedWalletAmount = usedWalletAmount ?? this.usedWalletAmount
      ..paymentType = paymentType ?? this.paymentType
      ..transactionId = transactionId ?? this.transactionId
      ..transactionDetails = transactionDetails ?? this.transactionDetails
      ..billingStatus = billingStatus ?? this.billingStatus
      ..description = description ?? this.description
      ..paymentStatus = paymentStatus ?? this.paymentStatus
      ..initiateConfirm = initiateConfirm ?? this.initiateConfirm
      ..fullName = fullName ?? this.fullName
      ..registeredOb = registeredOb ?? this.registeredOb
      ..emailId = emailId ?? this.emailId;
  }
}

CartOrderDataOrderitemdata $CartOrderDataOrderitemdataFromJson(
    Map<String, dynamic> json) {
  final CartOrderDataOrderitemdata cartOrderDataOrderitemdata = CartOrderDataOrderitemdata();
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    cartOrderDataOrderitemdata.id = id;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    cartOrderDataOrderitemdata.productId = productId;
  }
  final String? quantity = jsonConvert.convert<String>(json['quantity']);
  if (quantity != null) {
    cartOrderDataOrderitemdata.quantity = quantity;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    cartOrderDataOrderitemdata.price = price;
  }
  final String? stockid = jsonConvert.convert<String>(json['stockid']);
  if (stockid != null) {
    cartOrderDataOrderitemdata.stockid = stockid;
  }
  final String? priceStock = jsonConvert.convert<String>(json['price_stock']);
  if (priceStock != null) {
    cartOrderDataOrderitemdata.priceStock = priceStock;
  }
  final String? netpayablecommission = jsonConvert.convert<String>(
      json['netpayablecommission']);
  if (netpayablecommission != null) {
    cartOrderDataOrderitemdata.netpayablecommission = netpayablecommission;
  }
  final String? sponsorCasback = jsonConvert.convert<String>(
      json['sponsor_casback']);
  if (sponsorCasback != null) {
    cartOrderDataOrderitemdata.sponsorCasback = sponsorCasback;
  }
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    cartOrderDataOrderitemdata.orderId = orderId;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    cartOrderDataOrderitemdata.status = status;
  }
  final dynamic statusUpdDate = json['status_upd_date'];
  if (statusUpdDate != null) {
    cartOrderDataOrderitemdata.statusUpdDate = statusUpdDate;
  }
  final String? orderItemStatus = jsonConvert.convert<String>(
      json['order_item_status']);
  if (orderItemStatus != null) {
    cartOrderDataOrderitemdata.orderItemStatus = orderItemStatus;
  }
  final String? itemPointsRedeemed = jsonConvert.convert<String>(
      json['item_points_redeemed']);
  if (itemPointsRedeemed != null) {
    cartOrderDataOrderitemdata.itemPointsRedeemed = itemPointsRedeemed;
  }
  final String? initiateConfirm = jsonConvert.convert<String>(
      json['initiate_confirm']);
  if (initiateConfirm != null) {
    cartOrderDataOrderitemdata.initiateConfirm = initiateConfirm;
  }
  final dynamic orderItemUpdDate = json['order_item_upd_date'];
  if (orderItemUpdDate != null) {
    cartOrderDataOrderitemdata.orderItemUpdDate = orderItemUpdDate;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    cartOrderDataOrderitemdata.userId = userId;
  }
  final dynamic updateBy = json['update_by'];
  if (updateBy != null) {
    cartOrderDataOrderitemdata.updateBy = updateBy;
  }
  final String? vendorConfirmationUpdatedBy = jsonConvert.convert<String>(
      json['vendor_confirmation_updated_by']);
  if (vendorConfirmationUpdatedBy != null) {
    cartOrderDataOrderitemdata.vendorConfirmationUpdatedBy =
        vendorConfirmationUpdatedBy;
  }
  final dynamic vendorConfirmationUpdatedAt = json['vendor_confirmation_updated_at'];
  if (vendorConfirmationUpdatedAt != null) {
    cartOrderDataOrderitemdata.vendorConfirmationUpdatedAt =
        vendorConfirmationUpdatedAt;
  }
  final dynamic packingEmpoyeeId = json['packing_empoyee_id'];
  if (packingEmpoyeeId != null) {
    cartOrderDataOrderitemdata.packingEmpoyeeId = packingEmpoyeeId;
  }
  final dynamic packedAt = json['packed_at'];
  if (packedAt != null) {
    cartOrderDataOrderitemdata.packedAt = packedAt;
  }
  final String? invoiceStatus = jsonConvert.convert<String>(
      json['invoice_status']);
  if (invoiceStatus != null) {
    cartOrderDataOrderitemdata.invoiceStatus = invoiceStatus;
  }
  final dynamic shippedEmpId = json['shipped_emp_id'];
  if (shippedEmpId != null) {
    cartOrderDataOrderitemdata.shippedEmpId = shippedEmpId;
  }
  final dynamic shippedAt = json['shipped_at'];
  if (shippedAt != null) {
    cartOrderDataOrderitemdata.shippedAt = shippedAt;
  }
  final dynamic deliveringAgencyId = json['delivering_agency_id'];
  if (deliveringAgencyId != null) {
    cartOrderDataOrderitemdata.deliveringAgencyId = deliveringAgencyId;
  }
  final dynamic podNumber = json['pod_number'];
  if (podNumber != null) {
    cartOrderDataOrderitemdata.podNumber = podNumber;
  }
  final String? podRate = jsonConvert.convert<String>(json['pod_rate']);
  if (podRate != null) {
    cartOrderDataOrderitemdata.podRate = podRate;
  }
  final String? deliveryStatusFromAgency = jsonConvert.convert<String>(
      json['delivery_status_from_agency']);
  if (deliveryStatusFromAgency != null) {
    cartOrderDataOrderitemdata.deliveryStatusFromAgency =
        deliveryStatusFromAgency;
  }
  final dynamic deliveryRecvedDateFromAgency = json['delivery_recved_date_from_agency'];
  if (deliveryRecvedDateFromAgency != null) {
    cartOrderDataOrderitemdata.deliveryRecvedDateFromAgency =
        deliveryRecvedDateFromAgency;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    cartOrderDataOrderitemdata.createdAt = createdAt;
  }
  final dynamic cancelledAt = json['cancelled_at'];
  if (cancelledAt != null) {
    cartOrderDataOrderitemdata.cancelledAt = cancelledAt;
  }
  final String? qtyUpdate = jsonConvert.convert<String>(json['qty_update']);
  if (qtyUpdate != null) {
    cartOrderDataOrderitemdata.qtyUpdate = qtyUpdate;
  }
  final String? paymentTest = jsonConvert.convert<String>(json['payment_test']);
  if (paymentTest != null) {
    cartOrderDataOrderitemdata.paymentTest = paymentTest;
  }
  return cartOrderDataOrderitemdata;
}

Map<String, dynamic> $CartOrderDataOrderitemdataToJson(
    CartOrderDataOrderitemdata entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['product_id'] = entity.productId;
  data['quantity'] = entity.quantity;
  data['price'] = entity.price;
  data['stockid'] = entity.stockid;
  data['price_stock'] = entity.priceStock;
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
  return data;
}

extension CartOrderDataOrderitemdataExtension on CartOrderDataOrderitemdata {
  CartOrderDataOrderitemdata copyWith({
    String? id,
    String? productId,
    String? quantity,
    String? price,
    String? stockid,
    String? priceStock,
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
  }) {
    return CartOrderDataOrderitemdata()
      ..id = id ?? this.id
      ..productId = productId ?? this.productId
      ..quantity = quantity ?? this.quantity
      ..price = price ?? this.price
      ..stockid = stockid ?? this.stockid
      ..priceStock = priceStock ?? this.priceStock
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
      ..paymentTest = paymentTest ?? this.paymentTest;
  }
}