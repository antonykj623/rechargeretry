import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/Protracker_NotInvoice_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/Protracker_NotInvoice_entity.g.dart';

@JsonSerializable()
class ProtrackerNotInvoiceEntity {
	int? status = 0;
	String? message = '';
	List<ProtrackerNotInvoiceData>? data = [];

	ProtrackerNotInvoiceEntity();

	factory ProtrackerNotInvoiceEntity.fromJson(Map<String, dynamic> json) => $ProtrackerNotInvoiceEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProtrackerNotInvoiceEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProtrackerNotInvoiceData {
	@JSONField(name: "order_id")
	String? orderId = '';
	String? id = '';
	@JSONField(name: "retried_order_item_id")
	String? retriedOrderItemId = '';
	@JSONField(name: "reg_id")
	String? regId = '';
	@JSONField(name: "date_order")
	String? dateOrder = '';
	@JSONField(name: "delivery_date")
	dynamic deliveryDate;
	@JSONField(name: "address_id")
	String? addressId = '';
	String? totalprice = '';
	String? isWalletUsed = '';
	@JSONField(name: "paid_amount")
	String? paidAmount = '';
	@JSONField(name: "used_wallet_amount")
	String? usedWalletAmount = '';
	@JSONField(name: "payment_type")
	String? paymentType = '';
	@JSONField(name: "transaction_id")
	String? transactionId = '';
	@JSONField(name: "transaction_details")
	String? transactionDetails = '';
	@JSONField(name: "billing_status")
	String? billingStatus = '';
	String? description = '';
	@JSONField(name: "payment_status")
	String? paymentStatus = '';
	String? ordertitemid = '';
	@JSONField(name: "product_id")
	String? productId = '';
	String? quantity = '';
	String? price = '';
	String? stockid = '';
	@JSONField(name: "price_stock")
	String? priceStock = '';
	String? netpayablecommission = '';
	@JSONField(name: "sponsor_casback")
	String? sponsorCasback = '';
	String? status = '';
	@JSONField(name: "status_upd_date")
	dynamic statusUpdDate;
	@JSONField(name: "order_item_status")
	String? orderItemStatus = '';
	@JSONField(name: "item_points_redeemed")
	String? itemPointsRedeemed = '';
	@JSONField(name: "initiate_confirm")
	String? initiateConfirm = '';
	@JSONField(name: "order_item_upd_date")
	dynamic orderItemUpdDate;
	@JSONField(name: "user_id")
	String? userId = '';
	@JSONField(name: "update_by")
	dynamic updateBy;
	@JSONField(name: "vendor_confirmation_updated_by")
	String? vendorConfirmationUpdatedBy = '';
	@JSONField(name: "vendor_confirmation_updated_at")
	dynamic vendorConfirmationUpdatedAt;
	@JSONField(name: "packing_empoyee_id")
	dynamic packingEmpoyeeId;
	@JSONField(name: "packed_at")
	dynamic packedAt;
	@JSONField(name: "invoice_status")
	String? invoiceStatus = '';
	@JSONField(name: "shipped_emp_id")
	dynamic shippedEmpId;
	@JSONField(name: "shipped_at")
	dynamic shippedAt;
	@JSONField(name: "delivering_agency_id")
	dynamic deliveringAgencyId;
	@JSONField(name: "pod_number")
	dynamic podNumber;
	@JSONField(name: "pod_rate")
	String? podRate = '';
	@JSONField(name: "delivery_status_from_agency")
	String? deliveryStatusFromAgency = '';
	@JSONField(name: "delivery_recved_date_from_agency")
	dynamic deliveryRecvedDateFromAgency;
	@JSONField(name: "created_at")
	String? createdAt = '';
	@JSONField(name: "cancelled_at")
	dynamic cancelledAt;
	@JSONField(name: "qty_update")
	String? qtyUpdate = '';
	@JSONField(name: "payment_test")
	String? paymentTest = '';
	@JSONField(name: "refund_date")
	String? refundDate = '';
	@JSONField(name: "refund_status")
	String? refundStatus = '';
	@JSONField(name: "pool_update")
	String? poolUpdate = '';

	ProtrackerNotInvoiceData();

	factory ProtrackerNotInvoiceData.fromJson(Map<String, dynamic> json) => $ProtrackerNotInvoiceDataFromJson(json);

	Map<String, dynamic> toJson() => $ProtrackerNotInvoiceDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}