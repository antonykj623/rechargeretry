import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:recharge_retry/web/apiservices.dart';

import 'kydetails.dart';

class KYCApprovedPage extends StatefulWidget {
  const KYCApprovedPage({Key? key}) : super(key: key);

  @override
  State<KYCApprovedPage> createState() => _KYCApprovedPageState();
}

class _KYCApprovedPageState extends State<KYCApprovedPage> {
  DateTime selectedDate = DateTime.now();

  bool isLoading = false;
  List<dynamic> kycList = [];

  @override
  void initState() {
    super.initState();
    fetchKYC();
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });

      fetchKYC();
    }
  }

  Future<void> fetchKYC() async {
    setState(() {
      isLoading = true;
    });

    String date = DateFormat('yyyy-MM-dd').format(selectedDate);

    String url =
        "https://mysaving.in/IntegraAccount/api/getKYCdataByApprovedDate.php"
        "?kyc_update_date=$date"
        "&timestamp=${DateTime.now().millisecondsSinceEpoch}";

    try {


      final response = await new ApiHelper().getApiResponse(url);



        print(response);


        final jsonData = json.decode(response);

        if (jsonData["status"] == 1) {
          setState(() {
            kycList = jsonData["data"];
          });
        } else {
          setState(() {
            kycList = [];
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(jsonData["message"])),
          );
        }

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  Widget buildCard(dynamic item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              item["full_name"] ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 8),

            Text("Reg Code : ${item["reg_code"]}"),
            Text("Mobile : ${item["mobile"]}"),
            Text("Aadhar : ${item["adhar_no"]}"),
            Text("PAN : ${item["pan_no"]}"),
            Text("Bank : ${item["bank_name"]}"),
            Text("Account : ${item["bank_account_no"]}"),
            Text("IFSC : ${item["ifsc"]}"),
            Text("Branch : ${item["branch_name"]}"),
            Text("Email : ${item["email_id"]}"),
            Text("Updated : ${item["kyc_update_date"]}"),

            const SizedBox(height: 8),

            TextButton(onPressed: (){

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => KycDetailsPage(
                    item: item,
                  ),
                ),
              );


            }, child: Text("View Details",style: TextStyle(fontSize: 15,color: Colors.blue),))

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    String displayDate =
    DateFormat("dd-MM-yyyy").format(selectedDate);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Approved KYC"),
      ),

      body: Column(
        children: [

          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [

                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: selectDate,
                    icon: const Icon(Icons.calendar_month),
                    label: Text(displayDate),
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: fetchKYC,
                  child: const Text("Search"),
                )

              ],
            ),
          ),

          Expanded(
            child: isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : kycList.isEmpty
                ? const Center(
              child: Text("No Data Found"),
            )
                : RefreshIndicator(
              onRefresh: fetchKYC,
              child: ListView.builder(
                itemCount: kycList.length,
                itemBuilder: (context, index) {
                  return buildCard(kycList[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}