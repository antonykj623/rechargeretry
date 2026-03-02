import 'package:recharge_retry/generated/json/base/json_convert_content.dart';
import 'package:recharge_retry/domain/Protracker_NotInvoice_entity.dart';

ProtrackerNotInvoiceEntity $ProtrackerNotInvoiceEntityFromJson(
    Map<String, dynamic> json) {
  final ProtrackerNotInvoiceEntity protrackerNotInvoiceEntity = ProtrackerNotInvoiceEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    protrackerNotInvoiceEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    protrackerNotInvoiceEntity.message = message;
  }
  final List<ProtrackerNotInvoiceData>? data = (json['data'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ProtrackerNotInvoiceData>(
          e) as ProtrackerNotInvoiceData)
      .toList();
  if (data != null) {
    protrackerNotInvoiceEntity.data = data;
  }
  return protrackerNotInvoiceEntity;
}

Map<String, dynamic> $ProtrackerNotInvoiceEntityToJson(
    ProtrackerNotInvoiceEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  return data;
}

extension ProtrackerNotInvoiceEntityExtension on ProtrackerNotInvoiceEntity {
  ProtrackerNotInvoiceEntity copyWith({
    int? status,
    String? message,
    List<ProtrackerNotInvoiceData>? data,
  }) {
    return ProtrackerNotInvoiceEntity()
      ..status = status ?? this.status
      ..message = message ?? this.message
      ..data = data ?? this.data;
  }
}

ProtrackerNotInvoiceData $ProtrackerNotInvoiceDataFromJson(
    Map<String, dynamic> json) {
  final ProtrackerNotInvoiceData protrackerNotInvoiceData = ProtrackerNotInvoiceData();
  final String? orderId = jsonConvert.convert<String>(json['order_id']);
  if (orderId != null) {
    protrackerNotInvoiceData.orderId = orderId;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    protrackerNotInvoiceData.id = id;
  }
  final String? retriedOrderItemId = jsonConvert.convert<String>(
      json['retried_order_item_id']);
  if (retriedOrderItemId != null) {
    protrackerNotInvoiceData.retriedOrderItemId = retriedOrderItemId;
  }
  final String? regId = jsonConvert.convert<String>(json['reg_id']);
  if (regId != null) {
    protrackerNotInvoiceData.regId = regId;
  }
  final String? dateOrder = jsonConvert.convert<String>(json['date_order']);
  if (dateOrder != null) {
    protrackerNotInvoiceData.dateOrder = dateOrder;
  }
  final dynamic deliveryDate = json['delivery_date'];
  if (deliveryDate != null) {
    protrackerNotInvoiceData.deliveryDate = deliveryDate;
  }
  final String? addressId = jsonConvert.convert<String>(json['address_id']);
  if (addressId != null) {
    protrackerNotInvoiceData.addressId = addressId;
  }
  final String? totalprice = jsonConvert.convert<String>(json['totalprice']);
  if (totalprice != null) {
    protrackerNotInvoiceData.totalprice = totalprice;
  }
  final String? isWalletUsed = jsonConvert.convert<String>(
      json['isWalletUsed']);
  if (isWalletUsed != null) {
    protrackerNotInvoiceData.isWalletUsed = isWalletUsed;
  }
  final String? paidAmount = jsonConvert.convert<String>(json['paid_amount']);
  if (paidAmount != null) {
    protrackerNotInvoiceData.paidAmount = paidAmount;
  }
  final String? usedWalletAmount = jsonConvert.convert<String>(
      json['used_wallet_amount']);
  if (usedWalletAmount != null) {
    protrackerNotInvoiceData.usedWalletAmount = usedWalletAmount;
  }
  final String? paymentType = jsonConvert.convert<String>(json['payment_type']);
  if (paymentType != null) {
    protrackerNotInvoiceData.paymentType = paymentType;
  }
  final String? transactionId = jsonConvert.convert<String>(
      json['transaction_id']);
  if (transactionId != null) {
    protrackerNotInvoiceData.transactionId = transactionId;
  }
  final String? transactionDetails = jsonConvert.convert<String>(
      json['transaction_details']);
  if (transactionDetails != null) {
    protrackerNotInvoiceData.transactionDetails = transactionDetails;
  }
  final String? billingStatus = jsonConvert.convert<String>(
      json['billing_status']);
  if (billingStatus != null) {
    protrackerNotInvoiceData.billingStatus = billingStatus;
  }
  final String? description = jsonConvert.convert<String>(json['description']);
  if (description != null) {
    protrackerNotInvoiceData.description = description;
  }
  final String? paymentStatus = jsonConvert.convert<String>(
      json['payment_status']);
  if (paymentStatus != null) {
    protrackerNotInvoiceData.paymentStatus = paymentStatus;
  }
  final String? ordertitemid = jsonConvert.convert<String>(
      json['ordertitemid']);
  if (ordertitemid != null) {
    protrackerNotInvoiceData.ordertitemid = ordertitemid;
  }
  final String? productId = jsonConvert.convert<String>(json['product_id']);
  if (productId != null) {
    protrackerNotInvoiceData.productId = productId;
  }
  final String? quantity = jsonConvert.convert<String>(json['quantity']);
  if (quantity != null) {
    protrackerNotInvoiceData.quantity = quantity;
  }
  final String? price = jsonConvert.convert<String>(json['price']);
  if (price != null) {
    protrackerNotInvoiceData.price = price;
  }
  final String? stockid = jsonConvert.convert<String>(json['stockid']);
  if (stockid != null) {
    protrackerNotInvoiceData.stockid = stockid;
  }
  final String? priceStock = jsonConvert.convert<String>(json['price_stock']);
  if (priceStock != null) {
    protrackerNotInvoiceData.priceStock = priceStock;
  }
  final String? netpayablecommission = jsonConvert.convert<String>(
      json['netpayablecommission']);
  if (netpayablecommission != null) {
    protrackerNotInvoiceData.netpayablecommission = netpayablecommission;
  }
  final String? sponsorCasback = jsonConvert.convert<String>(
      json['sponsor_casback']);
  if (sponsorCasback != null) {
    protrackerNotInvoiceData.sponsorCasback = sponsorCasback;
  }
  final String? status = jsonConvert.convert<String>(json['status']);
  if (status != null) {
    protrackerNotInvoiceData.status = status;
  }
  final dynamic statusUpdDate = json['status_upd_date'];
  if (statusUpdDate != null) {
    protrackerNotInvoiceData.statusUpdDate = statusUpdDate;
  }
  final String? orderItemStatus = jsonConvert.convert<String>(
      json['order_item_status']);
  if (orderItemStatus != null) {
    protrackerNotInvoiceData.orderItemStatus = orderItemStatus;
  }
  final String? itemPointsRedeemed = jsonConvert.convert<String>(
      json['item_points_redeemed']);
  if (itemPointsRedeemed != null) {
    protrackerNotInvoiceData.itemPointsRedeemed = itemPointsRedeemed;
  }
  final String? initiateConfirm = jsonConvert.convert<String>(
      json['initiate_confirm']);
  if (initiateConfirm != null) {
    protrackerNotInvoiceData.initiateConfirm = initiateConfirm;
  }
  final dynamic orderItemUpdDate = json['order_item_upd_date'];
  if (orderItemUpdDate != null) {
    protrackerNotInvoiceData.orderItemUpdDate = orderItemUpdDate;
  }
  final String? userId = jsonConvert.convert<String>(json['user_id']);
  if (userId != null) {
    protrackerNotInvoiceData.userId = userId;
  }
  final dynamic updateBy = json['update_by'];
  if (updateBy != null) {
    protrackerNotInvoiceData.updateBy = updateBy;
  }
  final String? vendorConfirmationUpdatedBy = jsonConvert.convert<String>(
      json['vendor_confirmation_updated_by']);
  if (vendorConfirmationUpdatedBy != null) {
    protrackerNotInvoiceData.vendorConfirmationUpdatedBy =
        vendorConfirmationUpdatedBy;
  }
  final dynamic vendorConfirmationUpdatedAt = json['vendor_confirmation_updated_at'];
  if (vendorConfirmationUpdatedAt != null) {
    protrackerNotInvoiceData.vendorConfirmationUpdatedAt =
        vendorConfirmationUpdatedAt;
  }
  final dynamic packingEmpoyeeId = json['packing_empoyee_id'];
  if (packingEmpoyeeId != null) {
    protrackerNotInvoiceData.packingEmpoyeeId = packingEmpoyeeId;
  }
  final dynamic packedAt = json['packed_at'];
  if (packedAt != null) {
    protrackerNotInvoiceData.packedAt = packedAt;
  }
  final String? invoiceStatus = jsonConvert.convert<String>(
      json['invoice_status']);
  if (invoiceStatus != null) {
    protrackerNotInvoiceData.invoiceStatus = invoiceStatus;
  }
  final dynamic shippedEmpId = json['shipped_emp_id'];
  if (shippedEmpId != null) {
    protrackerNotInvoiceData.shippedEmpId = shippedEmpId;
  }
  final dynamic shippedAt = json['shipped_at'];
  if (shippedAt != null) {
    protrackerNotInvoiceData.shippedAt = shippedAt;
  }
  final dynamic deliveringAgencyId = json['delivering_agency_id'];
  if (deliveringAgencyId != null) {
    protrackerNotInvoiceData.deliveringAgencyId = deliveringAgencyId;
  }
  final dynamic podNumber = json['pod_number'];
  if (podNumber != null) {
    protrackerNotInvoiceData.podNumber = podNumber;
  }
  final String? podRate = jsonConvert.convert<String>(json['pod_rate']);
  if (podRate != null) {
    protrackerNotInvoiceData.podRate = podRate;
  }
  final String? deliveryStatusFromAgency = jsonConvert.convert<String>(
      json['delivery_status_from_agency']);
  if (deliveryStatusFromAgency != null) {
    protrackerNotInvoiceData.deliveryStatusFromAgency =
        deliveryStatusFromAgency;
  }
  final dynamic deliveryRecvedDateFromAgency = json['delivery_recved_date_from_agency'];
  if (deliveryRecvedDateFromAgency != null) {
    protrackerNotInvoiceData.deliveryRecvedDateFromAgency =
        deliveryRecvedDateFromAgency;
  }
  final String? createdAt = jsonConvert.convert<String>(json['created_at']);
  if (createdAt != null) {
    protrackerNotInvoiceData.createdAt = createdAt;
  }
  final dynamic cancelledAt = json['cancelled_at'];
  if (cancelledAt != null) {
    protrackerNotInvoiceData.cancelledAt = cancelledAt;
  }
  final String? qtyUpdate = jsonConvert.convert<String>(json['qty_update']);
  if (qtyUpdate != null) {
    protrackerNotInvoiceData.qtyUpdate = qtyUpdate;
  }
  final String? paymentTest = jsonConvert.convert<String>(json['payment_test']);
  if (paymentTest != null) {
    protrackerNotInvoiceData.paymentTest = paymentTest;
  }
  final String? refundDate = jsonConvert.convert<String>(json['refund_date']);
  if (refundDate != null) {
    protrackerNotInvoiceData.refundDate = refundDate;
  }
  final String? refundStatus = jsonConvert.convert<String>(
      json['refund_status']);
  if (refundStatus != null) {
    protrackerNotInvoiceData.refundStatus = refundStatus;
  }
  final String? poolUpdate = jsonConvert.convert<String>(json['pool_update']);
  if (poolUpdate != null) {
    protrackerNotInvoiceData.poolUpdate = poolUpdate;
  }
  return protrackerNotInvoiceData;
}

Map<String, dynamic> $ProtrackerNotInvoiceDataToJson(
    ProtrackerNotInvoiceData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['order_id'] = entity.orderId;
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
  data['ordertitemid'] = entity.ordertitemid;
  data['product_id'] = entity.productId;
  data['quantity'] = entity.quantity;
  data['price'] = entity.price;
  data['stockid'] = entity.stockid;
  data['price_stock'] = entity.priceStock;
  data['netpayablecommission'] = entity.netpayablecommission;
  data['sponsor_casback'] = entity.sponsorCasback;
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
  data['refund_date'] = entity.refundDate;
  data['refund_status'] = entity.refundStatus;
  data['pool_update'] = entity.poolUpdate;
  return data;
}

extension ProtrackerNotInvoiceDataExtension on ProtrackerNotInvoiceData {
  ProtrackerNotInvoiceData copyWith({
    String? orderId,
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
    String? ordertitemid,
    String? productId,
    String? quantity,
    String? price,
    String? stockid,
    String? priceStock,
    String? netpayablecommission,
    String? sponsorCasback,
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
    String? refundDate,
    String? refundStatus,
    String? poolUpdate,
  }) {
    return ProtrackerNotInvoiceData()
      ..orderId = orderId ?? this.orderId
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
      ..ordertitemid = ordertitemid ?? this.ordertitemid
      ..productId = productId ?? this.productId
      ..quantity = quantity ?? this.quantity
      ..price = price ?? this.price
      ..stockid = stockid ?? this.stockid
      ..priceStock = priceStock ?? this.priceStock
      ..netpayablecommission = netpayablecommission ?? this.netpayablecommission
      ..sponsorCasback = sponsorCasback ?? this.sponsorCasback
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
      ..refundDate = refundDate ?? this.refundDate
      ..refundStatus = refundStatus ?? this.refundStatus
      ..poolUpdate = poolUpdate ?? this.poolUpdate;
  }
}