import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recharge_retry/web/apiservices.dart';
import 'package:recharge_retry/widgets/addAmount.dart';
import '../domain/event_amountmodel.dart';
import '../domain/eventmodel.dart';
class EventAmountScreen extends StatefulWidget { final String eventId; EventAmountScreen({required this.eventId}); @override _EventAmountScreenState createState() => _EventAmountScreenState(); }
class _EventAmountScreenState extends State<EventAmountScreen> {

  List<EventAmountModel> allData = [];
  List<EventAmountModel> filteredData = [];

  bool isLoading = true;

  double totalGpay = 0;
  double totalCash = 0;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  /// 🔥 Load API
  Future<void> loadData() async {
    final data = await fetchEventAmounts(widget.eventId);

    setState(() {
      allData = data;
      filteredData = data;
      calculateTotals();
      isLoading = false;
    });
  }

  /// 🔥 Calculate totals
  void calculateTotals() {
    totalGpay = 0;
    totalCash = 0;

    for (var item in filteredData) {
      double amt = double.tryParse(item.amount) ?? 0;

      if (item.pType == "0") {
        totalGpay += amt;
      } else {
        totalCash += amt;
      }
    }
  }

  /// 🔍 Search
  void searchData(String query) {
    filteredData = allData.where((item) {
      return item.remarks.toLowerCase().contains(query.toLowerCase()) ||
          item.amount.contains(query);
    }).toList();

    calculateTotals();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Payments"),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddEventAmountScreen(eventId: widget.eventId),
                  ),
                ).then((_) => loadData()); // 🔄 refresh after add
              },
              child: Icon(Icons.add, size: 25),
            ),
          )
        ],
      ),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
        children: [

          /// 🔍 SEARCH
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: searchData,
              decoration: InputDecoration(
                hintText: "Search by amount or remarks",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          /// 💰 TOTALS
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("GPay: ₹$totalGpay",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold)),
                Text("Cash: ₹$totalCash",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          SizedBox(height: 10),

          /// 📜 LIST
          Expanded(
            child: ListView.builder(
              itemCount: filteredData.length,
              itemBuilder: (context, index) {
                final item = filteredData[index];

                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text("₹ ${item.amount}"),
                    subtitle: Text(item.remarks),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.pType == "0" ? "GPay" : "Cash",
                          style: TextStyle(
                            color: item.pType == "0"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        Text(
                          item.createdAt,
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<EventAmountModel>> fetchEventAmounts(String eventId) async {
    ApiHelper apiHelper=new ApiHelper();
    String t=apiHelper.getRandomnumber();
    final url = Uri.parse(
        "https://mysaving.in/IntegraAccount/ecommerce_api/getEventAmountList.php?operation=get&event_id=$eventId"+"&q="+t
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List list = data['response'];

      return list.map((e) => EventAmountModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load amounts");
    }
  }


}

