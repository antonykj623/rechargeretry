import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/cart_order_details_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/cart_order_details_entity.g.dart';

@JsonSerializable()
class CartOrderDetailsEntity {
	int? status = 0;
	String? message = '';
	CartOrderDetailsData? data;

	CartOrderDetailsEntity();

	factory CartOrderDetailsEntity.fromJson(Map<String, dynamic> json) => $CartOrderDetailsEntityFromJson(json);

	Map<String, dynamic> toJson() => $CartOrderDetailsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class CartOrderDetailsData {
	@JSONField(name: "cart_orderitemid")
	String? cartOrderitemid = '';
	String? id = '';
	@JSONField(name: "product_id")
	String? productId = '';
	String? quantity = '';
	String? price = '';
	String? stockid = '';
	String? netpayablecommission = '';
	@JSONField(name: "sponsor_casback")
	String? sponsorCasback = '';
	@JSONField(name: "order_id")
	String? orderId = '';
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
	String? orderItemUpdDate = '';
	@JSONField(name: "user_id")
	String? userId = '';
	@JSONField(name: "update_by")
	dynamic updateBy;
	@JSONField(name: "vendor_confirmation_updated_by")
	String? vendorConfirmationUpdatedBy = '';
	@JSONField(name: "vendor_confirmation_updated_at")
	String? vendorConfirmationUpdatedAt = '';
	@JSONField(name: "packing_empoyee_id")
	String? packingEmpoyeeId = '';
	@JSONField(name: "packed_at")
	String? packedAt = '';
	@JSONField(name: "invoice_status")
	String? invoiceStatus = '';
	@JSONField(name: "shipped_emp_id")
	String? shippedEmpId = '';
	@JSONField(name: "shipped_at")
	String? shippedAt = '';
	@JSONField(name: "delivering_agency_id")
	String? deliveringAgencyId = '';
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
	@JSONField(name: "product_name")
	String? productName = '';
	@JSONField(name: "product_code")
	String? productCode = '';
	String? hsncode = '';
	@JSONField(name: "category_id")
	String? categoryId = '';
	@JSONField(name: "sub_category_id")
	String? subCategoryId = '';
	@JSONField(name: "product_description")
	String? productDescription = '';
	@JSONField(name: "product_spec")
	String? productSpec = '';
	@JSONField(name: "prime_image")
	String? primeImage = '';
	@JSONField(name: "side_image1")
	dynamic sideImage1;
	@JSONField(name: "side_image2")
	dynamic sideImage2;
	@JSONField(name: "side_image3")
	dynamic sideImage3;
	@JSONField(name: "side_image4")
	dynamic sideImage4;
	@JSONField(name: "unit_id")
	String? unitId = '';
	@JSONField(name: "size_enabled")
	String? sizeEnabled = '';
	@JSONField(name: "color_enabled")
	String? colorEnabled = '';
	String? color = '';
	String? size = '';
	@JSONField(name: "vendor_id")
	String? vendorId = '';
	@JSONField(name: "return_policy_id")
	String? returnPolicyId = '';
	@JSONField(name: "offered_item_status")
	String? offeredItemStatus = '';
	String? returnable = '';
	@JSONField(name: "return_days")
	String? returnDays = '';
	String? upd = '';
	@JSONField(name: "d_type")
	dynamic dType;
	@JSONField(name: "proid_from")
	dynamic proidFrom;
	dynamic sz;
	@JSONField(name: "current_qty")
	String? currentQty = '';
	@JSONField(name: "price_stock")
	String? priceStock = '';
	String? mrp = '';
	@JSONField(name: "savecart_price")
	String? savecartPrice = '';
	@JSONField(name: "pp_redemption")
	String? ppRedemption = '';
	@JSONField(name: "price_sales")
	String? priceSales = '';
	String? igst = '';
	String? sgst = '';
	String? csgt = '';
	@JSONField(name: "igst_amt")
	String? igstAmt = '';
	@JSONField(name: "sgst_amt")
	String? sgstAmt = '';
	@JSONField(name: "cgst_amt")
	String? cgstAmt = '';
	@JSONField(name: "price_without_gst")
	String? priceWithoutGst = '';
	String? margin = '';
	@JSONField(name: "gen_share_amt")
	String? genShareAmt = '';
	@JSONField(name: "cash_back")
	String? cashBack = '';
	@JSONField(name: "stock_entry_date")
	String? stockEntryDate = '';
	String? addressid = '';
	String? name = '';
	String? housename = '';
	String? flatno = '';
	String? landmark = '';
	String? place = '';
	String? district = '';
	String? phone = '';
	String? pincode = '';
	String? state = '';
	String? country = '';
	String? orderid = '';

	CartOrderDetailsData();

	factory CartOrderDetailsData.fromJson(Map<String, dynamic> json) => $CartOrderDetailsDataFromJson(json);

	Map<String, dynamic> toJson() => $CartOrderDetailsDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}