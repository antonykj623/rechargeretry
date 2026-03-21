import 'package:recharge_retry/generated/json/base/json_field.dart';
import 'package:recharge_retry/generated/json/protracker_entity.g.dart';
import 'dart:convert';
export 'package:recharge_retry/generated/json/protracker_entity.g.dart';

@JsonSerializable()
class ProtrackerEntity {
	int? status = 0;
	String? message = '';
	ProtrackerData? data;

	ProtrackerEntity();

	factory ProtrackerEntity.fromJson(Map<String, dynamic> json) => $ProtrackerEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProtrackerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProtrackerData {
	@JSONField(name: "product_id")
	String? productId = '';
	String? id = '';
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
	String? status = '';
	String? returnable = '';
	@JSONField(name: "return_days")
	String? returnDays = '';
	String? upd = '';
	String? stockid = '';
	@JSONField(name: "d_type")
	dynamic dType;
	@JSONField(name: "proid_from")
	dynamic proidFrom;
	dynamic sz;
	@JSONField(name: "current_qty")
	String? currentQty = '';
	@JSONField(name: "last_input_qty")
	String? lastInputQty = '';
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

	ProtrackerData();

	factory ProtrackerData.fromJson(Map<String, dynamic> json) => $ProtrackerDataFromJson(json);

	Map<String, dynamic> toJson() => $ProtrackerDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}