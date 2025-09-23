import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/dth_recharge/report/recharge_history_entity.dart';
import 'package:recharge_retry/web/apiservices.dart';

class RechargeReportPage extends StatefulWidget {
  const RechargeReportPage({Key? key}) : super(key: key);

  @override
  _RechargeReportPageState createState() => _RechargeReportPageState();
}

class _RechargeReportPageState extends State<RechargeReportPage> {
  // Sample data (you can replace this with API data)
  final List<RechargeHistoryData> reports = [

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getRechargeReports();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recharge Reports"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 cards per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.75, // card height ratio
          ),
          itemCount: reports.length,
          itemBuilder: (context, index) {
            final report = reports[index];
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Icon(Icons.receipt,size: 40,),
                    const SizedBox(height: 8),
                    Text(
                      report.accountNumber ?? "",
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "₹ ${report.amount.toString()}",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      report.paymentStatus.toString().compareTo("5")==0? "Payment Success":"Payment Failed",
                      style:  TextStyle(
                        color:  report.paymentStatus.toString().compareTo("5")==0?Colors.green:Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      report.rechargeDate.toString(),
                      style: const TextStyle(fontSize: 12, color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      report.status.toString().compareTo("1")==0? "Recharge Success":  (
                          report.status.toString().compareTo("0")==0)?"Recharge Failed" : (
                          report.status.toString().compareTo("2")==0)?"Recharge Pending" : "Refunded",
                      style:  TextStyle(
                        color:  report.status.toString().compareTo("1")==0? Colors.green:  (
                            report.status.toString().compareTo("0")==0)?Colors.red : (
                            report.status.toString().compareTo("2")==0)?Colors.blue: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  getRechargeReports()async{

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });


    String u="getRechargeHistoryReports.php";


    String urldata="https://mysaving.in/IntegraAccount/api/"+u+"?d="+DateTime.now().microsecondsSinceEpoch.toString();


    ApiHelper apiHelper=new ApiHelper();

    String response=await apiHelper.getApiResponse(urldata);

    WidgetsBinding.instance.addPostFrameCallback((_) {
Navigator.pop(context);

    });


    RechargeHistoryEntity rechargeHistoryEntity=RechargeHistoryEntity.fromJson(jsonDecode(response));


    if(rechargeHistoryEntity.status==1)
      {

        setState(() {
          reports.clear();
          reports.addAll(rechargeHistoryEntity.data!);

        });

      }




  }
}
