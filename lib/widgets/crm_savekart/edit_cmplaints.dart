import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/web/ApiMethodes.dart';
import 'package:recharge_retry/web/apiservices.dart';

class EditComplaintPage extends StatefulWidget {
  final Map<String, dynamic> complaint;

  const EditComplaintPage({Key? key, required this.complaint})
      : super(key: key);

  @override
  State<EditComplaintPage> createState() => _EditComplaintPageState();
}

class _EditComplaintPageState extends State<EditComplaintPage> {
  late TextEditingController issueDetailsController;
  late TextEditingController actionDetailsController;
  late TextEditingController personController;
  late TextEditingController sourceController;

  late TextEditingController issueNameController;
  late TextEditingController orderIDPHController;
  late TextEditingController appNameController;

  String selectedStatus = "0";

  final Map<String, String> statusMap = {
    "0": "Pending",
    "1": "In Progress",
    "2": "Resolved",
  };

  @override
  void initState() {
    super.initState();

    issueDetailsController =
        TextEditingController(text: widget.complaint['issue_details'] ?? "");

    actionDetailsController =
        TextEditingController(text: widget.complaint['action_details'] ?? "");

    personController =
        TextEditingController(text: widget.complaint['person'] ?? "");

    sourceController =
        TextEditingController(text: widget.complaint['source'] ?? "");

    orderIDPHController =
        TextEditingController(text: widget.complaint['orderid'] ?? "");

    issueNameController =
        TextEditingController(text: widget.complaint['issue_name'] ?? "");

    sourceController =
        TextEditingController(text: widget.complaint['source'] ?? "");

    appNameController =
        TextEditingController(text: widget.complaint['mobile_app'] ?? "");

    selectedStatus = widget.complaint['status'] ?? "0";
  }

  @override
  void dispose() {
    issueDetailsController.dispose();
    actionDetailsController.dispose();
    personController.dispose();
    sourceController.dispose();
  issueNameController.dispose();
    orderIDPHController.dispose();
   appNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Complaint"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // _infoRow("Complaint ID", widget.complaint['id']),
            //
            //
            // _infoRow("Issue", widget.complaint['issue_name']),

            _buildTextField(
              label: "Mobile App",
              controller: appNameController,
              maxLines: 1,
            ),
            _buildTextField(
              label: "Order ID or Mobile number",
              controller: orderIDPHController,
              maxLines: 1,
            ),

            _buildTextField(
              label: "Issue Name",
              controller: issueNameController,
              maxLines: 2,
            ),

            const SizedBox(height: 16),

            /// 🔹 Status Dropdown
            const Text("Status", style: TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: selectedStatus,
              items: statusMap.entries
                  .map(
                    (e) => DropdownMenuItem(
                  value: e.key,
                  child: Text(e.value),
                ),
              )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 14),

            _buildTextField(
              label: "Issue Details",
              controller: issueDetailsController,
              maxLines: 3,
            ),

            _buildTextField(
              label: "Remarks",
              controller: actionDetailsController,
              maxLines: 3,
            ),

            _buildTextField(
              label: "Person",
              controller: personController,
            ),

            _buildTextField(
              label: "Source",
              controller: sourceController,
            ),

            const SizedBox(height: 24),

            /// 🔹 Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saveComplaint,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  "Update Complaint",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 🔹 Info Row (Non-editable)
  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Text("$title: ",
              style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value ?? "-")),
        ],
      ),
    );
  }

  /// 🔹 Text Field
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 Save Action
  Future<void> _saveComplaint() async {
    Map<String,String> updatedData = {
      "id": widget.complaint['id'],
      "status": selectedStatus,
      "issue_details": issueDetailsController.text.trim(),
      "action_details": actionDetailsController.text.trim(),
      "issue_name":issueNameController.text.trim(),
      "mobile_app":appNameController.text.trim(),
      "orderid":orderIDPHController.text.trim(),
      "person": personController.text.trim(),
      "source": sourceController.text.trim(),
    };



    print("UPDATED DATA => $updatedData");

    // 🔥 API call here

    //updateCRMDEtails.php

    ApiHelper.showLoaderDialog(context);

    ApiHelper apiHelper =new ApiHelper();

    String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.updateCRMDEtails+"?q="+apiHelper.getRandomnumber();


    String result=await apiHelper.postApiResponse(urldata, updatedData);

    var js=jsonDecode(result);

    if(js['status']==1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Complaint updated successfully")),
      );

      Navigator.pop(context, updatedData);
    }
    else{
      Navigator.pop(context);

      ApiHelper.showAlertDialog(context, "Complaint Details updation failed");
    }
  }
}
