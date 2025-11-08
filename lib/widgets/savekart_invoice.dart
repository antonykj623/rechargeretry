import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class InvoiceGroupedScreen extends StatefulWidget {
  const InvoiceGroupedScreen({Key? key}) : super(key: key);

  @override
  State<InvoiceGroupedScreen> createState() => _InvoiceGroupedScreenState();
}

class _InvoiceGroupedScreenState extends State<InvoiceGroupedScreen> {
  DateTime selectedDate = DateTime.now();
  bool isLoading = false;
  Map<String, List<dynamic>> groupedData = {};
  Map<String, List<dynamic>> filteredData = {}; // 🔍 for search results
  TextEditingController searchController = TextEditingController();

  final String baseUrl =
      "https://mysaving.in/IntegraAccount/ecommerce_api/getSavekartinvoice.php";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    final String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    final url = Uri.parse("$baseUrl?date=$formattedDate");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data["status"] == 1) {
          List<dynamic> invoices = data["data"];

          // Group by phone + pincode
          Map<String, List<dynamic>> grouped = {};
          for (var item in invoices) {
            String phone = item["phone"]?.toString().trim() ?? "";
            String pincode = item["pincode"]?.toString().trim() ?? "";
            String key = "$phone-$pincode";

            if (!grouped.containsKey(key)) {
              grouped[key] = [];
            }
            grouped[key]!.add(item);
          }

          setState(() {
            groupedData = grouped;
            filteredData = grouped; // 👈 initialize search view
          });
        } else {
          groupedData = {};
          filteredData = {};
        }
      } else {
        groupedData = {};
        filteredData = {};
      }
    } catch (e) {
      debugPrint("Error fetching data: $e");
    }

    setState(() => isLoading = false);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() => selectedDate = picked);
      fetchData();
    }
  }

  // 🔍 Search logic
  void filterInvoices(String query) {
    if (query.isEmpty) {
      setState(() => filteredData = groupedData);
      return;
    }

    Map<String, List<dynamic>> temp = {};
    groupedData.forEach((key, list) {
      List<dynamic> matched = list.where((item) {
        String invoice = item["invoicenumber"]?.toString().toLowerCase() ?? "";
        return invoice.contains(query.toLowerCase());
      }).toList();

      if (matched.isNotEmpty) {
        temp[key] = matched;
      }
    });

    setState(() => filteredData = temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grouped Invoices"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 📅 Date Picker Button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.date_range),
              label: Text(DateFormat('yyyy-MM-dd').format(selectedDate)),
              onPressed: () => selectDate(context),
            ),
          ),

          // 🔍 Search TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search by Invoice ID...",
                prefixIcon: const Icon(Icons.search),
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: filterInvoices,
            ),
          ),

          Expanded(
            child: isLoading
                ? const Center(child: CircularProgressIndicator())
                : filteredData.isEmpty
                ? const Center(child: Text("No invoices found"))
                : ListView(
              children: filteredData.entries.map((entry) {
                String groupKey = entry.key;
                List<dynamic> invoices = entry.value;
                var first = invoices.first;

                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: invoices.map((item) {
                          String name =
                              item["full_name"]?.toString().trim() ??
                                  "";
                          String address =
                              "${item["name"]?.toString().trim() ?? ""}, "
                              "${item["housename"]?.toString().trim() ?? ""}, "
                              "${item["place"]?.toString().trim() ?? ""}, "
                              "${item["district"]?.toString().trim() ?? ""}, "
                              "${item["state"]?.toString().trim() ?? ""} - "
                              "${item["pincode"]?.toString().trim() ?? ""}, "
                              "${item["phone"]?.toString().trim() ?? ""}";

                          String orderId =
                              item["orderid"]?.toString() ?? "";
                          String productName =
                              item["product_name"]?.toString() ?? "";
                          String dateOrder =
                              item["date_order"]?.toString() ?? "";
                          String qty =
                              item["quantity"]?.toString() ?? "";
                          String invoice =
                              "${item["invoice_prefix"] ?? ""}${item["invoicenumber"] ?? ""}";

                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text("Created by: $name",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const Divider(),
                                Text("Delivery Address: $address",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const Divider(),
                                Text("🧾 Invoice No: $invoice"),
                                Text("🆔 Order ID: $orderId"),
                                Text("📦 Product: $productName"),
                                Text("Qty: $qty"),
                                Text("🗓 Ordered: $dateOrder"),
                                const Divider(
                                    color: Colors.redAccent),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
