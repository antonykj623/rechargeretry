import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/web/apiservices.dart';
import 'package:recharge_retry/widgets/crm_savekart/select_app_page.dart';
import 'package:intl/intl.dart';
import 'package:recharge_retry/widgets/crm_savekart/status_update.dart';

import '../../web/ApiMethodes.dart';
import 'edit_cmplaints.dart';
class ComplaintListPage extends StatefulWidget {
  const ComplaintListPage({Key? key}) : super(key: key);

  @override
  State<ComplaintListPage> createState() => _ComplaintListPageState();
}

class _ComplaintListPageState extends State<ComplaintListPage> {
  TextEditingController searchController = TextEditingController();
  DateTime? selectedDate;

  /// 🔹 Dummy complaint data (API ready)
   List<Map<String, dynamic>> complaints = [

  ];

  List<Map<String, dynamic>> filteredComplaints = [];

  getComplaintList(DateTime dateTime)async{

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ApiHelper.showLoaderDialog(context);
    // });

    String formatted = DateFormat('yyyy-MM-dd').format(dateTime);
    String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.getCRMComplainList+"?date_crm="+formatted+"&timestamp="+new ApiHelper().getRandomnumber();
    String response=await new ApiHelper().getApiResponse(urldata);

    print(response);



    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //
    //   Navigator.pop(context);
    //
    //
    // });

    var js = jsonDecode(response);

    if (js["status"] == 1) {
      setState(() {
        complaints.clear();
        filteredComplaints.clear();

        complaints = List<Map<String, dynamic>>.from(
          js["data"].map((e) => Map<String, dynamic>.from(e)),
        );

        filteredComplaints.addAll(complaints);
      });
    } else {
      setState(() {
        complaints.clear();
        filteredComplaints.clear();
      });

     // ApiHelper.showAlertDialog(context, "No data found");
    }


  }

  @override
  void initState() {
    super.initState();
   /// filteredComplaints = complaints;
    selectedDate=DateTime.now();
    getComplaintList(selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Complaints list",style: TextStyle(fontSize: 18),),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: IconButton(onPressed: (){

              getComplaintList(selectedDate!);

            }, icon: Icon(Icons.refresh,size: 25,)),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SelectAppPage()),
                );
              },
              child: const Text(
                "Add New",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _filterSection(),
          (selectedDate!=null)? Text(_formatDate(selectedDate.toString())):Container(),
          Container(height: 15,),
          Expanded(
            child: filteredComplaints.isEmpty
                ? _emptyView()
                : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: filteredComplaints.length,
              itemBuilder: (context, index) {
                return complaintListTile(filteredComplaints[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// 🔍 Filter Section (Search + Date)
  Widget _filterSection() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search by App Name",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (_) => _applyFilters(),
            ),

          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: _pickDate,
          ),
          if (selectedDate != null)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                selectedDate = null;
                _applyFilters();
              },
            ),
        ],
      ),
    );
  }

  /// 🧠 Apply Search & Date Filters
  void _applyFilters() {
    setState(() {
      filteredComplaints = complaints.where((item) {
        final appMatch = item['mobile_app']
            .toString()
            .toLowerCase()
            .contains(searchController.text.toLowerCase());



        return appMatch;
      }).toList();
    });
  }

  /// 📅 Pick Date
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      selectedDate = picked;
      getComplaintList(selectedDate!);
      _applyFilters();
    }
  }

  String _monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[month - 1];
  }

  /// 🧾 Complaint Card
  Widget complaintListTile(Map<String, dynamic> item) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        trailing: TextButton(onPressed: () async {

          final result = await showTwoMenuDialog(context);

          if (result == "status") {
            // Navigate to raise complaint page
            print("Raise Complaint selected");

            final result = await showStatusUpdateDialog(context);

            if (result != null) {
              print("Status: ${result['status']}");
              print("Remarks: ${result['remarks']}");

              String status="0";
              if(result['status'].toString().compareTo("processing")==0)
                {
                  status="1";
                }
              else if(result['status'].toString().compareTo("initiated")==0)
                {
                  status="0";
                }
              else{
                status="2";
              }

              //updateCRMStatus.php

              Map<String,String>mp=new HashMap();
              mp['status']=status;
              mp['remarks']=result['remarks'].toString();
              mp['id']=item['id'].toString();

              ApiHelper apiHelper=new ApiHelper();

              String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.updateCRMStatus+"?q="+apiHelper.getRandomnumber();

              String data=await apiHelper.postApiResponse(urldata, mp);

              var js=jsonDecode(data);

              if(js['status']==1)
                {
                  ApiHelper.showAlertDialog(context, "Status updaion successful");
                }
              else{

                ApiHelper.showAlertDialog(context, "Status updaion failed");
              }

              // 🔥 Call API here
            }

          } else if (result == "details") {
            // Navigate to complaint list
            print("View Complaints selected");

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => EditComplaintPage(
                  complaint: item, // Map<String, dynamic>
                ),
              ),
            );

          }


        }, child: Text("Change",style: TextStyle(fontSize: 14,color: Colors.green),)),

        title: Row(
          children: [
            Expanded(child:   Text(
              item['mobile_app'].toString().toUpperCase(),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),flex: 1,)

          ,
           Expanded(child: _statusChip(item['status']),flex: 1,)
            ,
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _rowText("Order ID or Phone", item['orderid']),
              _rowText("Issue", item['issue_name']),
              _rowText("Person", item['person']),
              _rowText("Issue Details", item['issue_details']),
              _rowText("Source", item['source']),
              const SizedBox(height: 6),
              Text(
                _formatDate(item['created_date']),
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          // Open Complaint Details
        },
      ),
    );
  }

  Future<Map<String, String>?> showStatusUpdateDialog(BuildContext context) {
    return showDialog<Map<String, String>>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return StatusUpdateDialog();
      },
    );
  }


  String _formatDate(String date) {
    final dt = DateTime.parse(date);
    return "${dt.day.toString().padLeft(2, '0')} "
        "${_monthName(dt.month)} "
        "${dt.year} • "
        "${dt.hour % 12 == 0 ? 12 : dt.hour % 12}:"
        "${dt.minute.toString().padLeft(2, '0')} "
        "${dt.hour >= 12 ? 'PM' : 'AM'}";
  }

  Future<String?> showTwoMenuDialog(BuildContext context) {
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose Action"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _menuItem(
                icon: Icons.access_time_rounded,
                title: "Change Status",
                onTap: () {
                  Navigator.pop(context, "status");
                },
              ),
              const Divider(),
              _menuItem(
                icon: Icons.list_alt,
                title: "Change details",
                onTap: () {
                  Navigator.pop(context, "details");
                },
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }


  /// 🟢 Status Chip
  Widget _statusChip(String status) {
    Color color;
    String statustext="";
    switch (status) {
      case "1":
        statustext="Processing";
        color = Colors.orange;
        break;
      case "0":
        statustext="Initiated";
        color = Colors.blue;
        break;
      case "2":
        statustext="Completed";
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statustext,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }

  /// 🔹 Key-Value Row
  Widget _rowText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 13),
          children: [
            TextSpan(
              text: "$title: ",
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  /// 💤 Empty View
  Widget _emptyView() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.support_agent, size: 80, color: Colors.grey),
          SizedBox(height: 12),
          Text(
            "No Complaints Found",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
