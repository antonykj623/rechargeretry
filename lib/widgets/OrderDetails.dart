import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/web/ApiMethodes.dart';
import 'package:recharge_retry/web/apiservices.dart';

class OrderDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const OrderDetailsScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  late Map<String, dynamic> order;

  @override
  void initState() {
    super.initState();
    order = widget.data;
  }


  updateData(String id,String orderidtoupdate)
  async {

    ApiHelper.showLoaderDialog(context);
    String ur=ApiMethodeCredentials.saveapp_baseurl+ApiMethodeCredentials.updateInvisibleOrderData+"?timestamp="+new ApiHelper().getRandomnumber();

    Map<String,String>mp=new HashMap();

    mp["id"]=id;
    mp["orderidToupdate"]=orderidtoupdate;


    String result=await new ApiHelper().postApiResponse(ur, mp);
    Navigator.pop(context);
    var js=jsonDecode(result);
    if(js["status"]==1)
      {
        ApiHelper.showAlertDialog(context, "Order updation success.Please check the order list");

      }
    else{

      ApiHelper.showAlertDialog(context, "Order updation failed");

    }



  }




  void showOrderItemDialog(BuildContext context, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [

                /// 🔹 Title
                const Center(
                  child: Text(
                    "Product Details",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                _row("Product", data["product_name"].toString().trim()),
                _row("Order ID", data["order_id"]),
                _row("Product ID", data["product_id"]),
                _row("Quantity", data["quantity"]),
                _row("Price", "₹ ${data["price"]}"),
                _row("Stock Price", "₹ ${data["price_stock"]}"),
                _row("Commission", "₹ ${data["netpayablecommission"]}"),
                _row("Sponsor Cashback", "₹ ${data["sponsor_casback"]}"),
                _row("Points Redeemed", data["item_points_redeemed"]),

                const Divider(height: 24),

                _row("Invoice Status", data["invoice_status"] == "1" ? "Generated" : "Pending"),
                _row("Order Item Status", data["order_item_status"]),
                _row("Delivery Status", data["delivery_status_from_agency"] == "1" ? "Delivered" : "Pending"),
                _row("Delivery Date", data["delivery_recved_date_from_agency"] ?? "-"),

                const Divider(height: 24),

                _row("Packed At", data["packed_at"] ?? "-"),
                _row("Shipped At", data["shipped_at"] ?? "-"),
                _row("Created At", data["created_at"]),

                const SizedBox(height: 20),

                /// 🔹 Close Button
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Expanded(child:  TextButton(
                        onPressed: () {

                          Navigator.pop(context);

                          String orderidToupdate=order["orderid"];
                          String id=data["id"];

                          updateData(id, orderidToupdate);






                        },
                        child: const Text("MERGE"),
                      ),flex: 1,),
                      Expanded(child:  TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("CLOSE"),
                      ),flex: 1,)
                    ],
                  )


                 ,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details",style: TextStyle(fontSize: 15),),
        centerTitle: false,
        actions: [
          Padding(padding: EdgeInsets.all(5),

          child: TextButton(onPressed: () async {

            //fetchOrderDetails.php

            String userid=order['user_id'];

            String date="";

            List<String>orderdatesplit=order['date_order'].toString().split(" ");

            if(orderdatesplit.length>0)
              {
                date=orderdatesplit[0];
              }


            String ur=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.fetchOrderDetails+"?timestamp="+new ApiHelper().getRandomnumber()+"&order_date="+date+"&user_id="+userid;
            ApiHelper.showLoaderDialog(context);


            ApiHelper apihelper=new ApiHelper();
            String js=await apihelper.getApiResponse(ur);

            Navigator.pop(context);

            var jsdata=jsonDecode(js);


            showOrderItemDialog(context,jsdata["data"]);

          }, child: Text("Fetch Order Items",style: TextStyle(fontSize: 12),)),

          )

        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 Order Summary
            _sectionTitle("Order Summary"),
            _infoRow("Order ID", order["orderid"]),
            _infoRow("Order Date", order["date_order"]),
            _infoRow("Total Price", "₹ ${order["totalprice"]}"),
            _infoRow("Paid Amount", "₹ ${order["paid_amount"]}"),
            _infoRow("Wallet Used", "₹ ${order["used_wallet_amount"]}"),

            const SizedBox(height: 20),

            /// 🔹 Delivery Address
            _sectionTitle("Delivery Address"),
            _infoRow("Name", order["name"]),
            _infoRow(
              "Address",
              "${order["housename"]} ${order["flatno"]}\n"
                  "${order["landmark"]}\n"
                  "${order["place"]}, ${order["district"]}\n"
                  "${order["pincode"]}",
            ),
            _infoRow("State", order["state"]),
            _infoRow("Country", order["country"]),

            const SizedBox(height: 20),

            /// 🔹 Contact
            _sectionTitle("Contact"),
            _infoRow("Phone", order["phone"]),

            const SizedBox(height: 30),

            /// 🔹 Status Badge
            Center(
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "Order Successful",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Section Title Widget
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  /// 🔹 Key Value Row
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
