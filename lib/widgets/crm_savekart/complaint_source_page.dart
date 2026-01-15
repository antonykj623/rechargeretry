import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/web/ApiMethodes.dart';
import 'package:recharge_retry/web/apiservices.dart';

class ComplaintSourcePage extends StatefulWidget {
  final String orderId;
  final String issue;
  final String reason;
  final String app;
  final String person;

  const ComplaintSourcePage({
    Key? key,
    required this.orderId,
    required this.issue,
    required this.reason,
    required this.app,
    required this.person
  }) : super(key: key);

  @override
  State<ComplaintSourcePage> createState() => _ComplaintSourcePageState();
}

class _ComplaintSourcePageState extends State<ComplaintSourcePage> {
  String? source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: const Text("Complaint Source")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _radio("WhatsApp Call"),
            _radio("WhatsApp Message"),
            _radio("Call"),
            _radio("Other"),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: source == null
                  ? null
                  : () async {


                ApiHelper.showLoaderDialog(context);

                Map<String,String> mp=new HashMap();
                mp['mobile_app']=widget.app;
                mp['issue_name']=widget.issue;
                mp['orderid']=widget.orderId;
                mp['issue_details']=widget.reason;
                mp['person']=widget.person;
                mp['source']=source!;

ApiHelper apihelper=new ApiHelper();
String response=await apihelper.postApiResponse(ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.addNewCRMComplaint+"?q="+apihelper.getRandomnumber(), mp);
Navigator.pop(context);
var js=jsonDecode(response);

if(js['status']==1)
  {
    ApiHelper.showAlertDialog(context, "Complaint submission successful");
    Navigator.popUntil(context, (r) => r.isFirst);

  }
else{

  ApiHelper.showAlertDialog(context, "Complaint submission failed");

}




              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  Widget _radio(String val) {
    return RadioListTile(
      title: Text(val),
      value: val,
      groupValue: source,
      onChanged: (v) => setState(() => source = v as String),
    );
  }
}
