import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recharge_retry/domain/PointsEntity.dart';
import '../domain/ProfileEntity.dart';
import '../web/apiservices.dart';

class WalletPoints extends StatefulWidget {

  UserData usr;



   WalletPoints(this.usr) ;

  @override
  _WalletPointsState createState() => _WalletPointsState(this.usr);
}

class _WalletPointsState extends State<WalletPoints> {


  UserData usr;

  String walletpoints="0";

  List<PointsData>? data = [];

  _WalletPointsState(this.usr) ;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWalletPoints();
    getWalletPointsTransaction();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text(usr.fullName+"\n"+usr.mobile,style: TextStyle(fontSize: 17,color: Colors.white),),
          leading: GestureDetector(

            child:Icon(Icons.arrow_back,color: Colors.white,size:25 ,) ,

            onTap: (){

              Navigator.pop(context);
            },
          ),
          backgroundColor: Color(0xff0B7D97),
          actions: [

//changewalletPoints.php


            IconButton(icon: Icon(Icons.add,color: Colors.white,), onPressed: () {

              showAmountDialog(context, (amount) async {
                print("User entered: ₹$amount");


                //changeWalletAmount.php

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ApiHelper.showLoaderDialog(context);
                });

                Map<String,String>mp={"user_id":usr.id,"amount":amount,"purpose":"Add"};

                ApiHelper apiHelper=new ApiHelper();

                String response=await apiHelper.postApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/changewalletPoints.php?timestamp="+apiHelper.getRandomnumber()+"&user_id="+usr.id.toString(),mp);

                print(response);


                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(context);
                });


                getWalletPoints();
                getWalletPointsTransaction();




              });


            },),

            IconButton(icon: Icon(Icons.remove,color: Colors.white,), onPressed: () {

              showAmountDialog(context, (amount) async {
                print("User entered: ₹$amount");


                //changeWalletAmount.php

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ApiHelper.showLoaderDialog(context);
                });

                Map<String,String>mp={"user_id":usr.id,"amount":amount,"purpose":"Reduce"};

                ApiHelper apiHelper=new ApiHelper();

                String response=await apiHelper.postApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/changewalletPoints.php?timestamp="+apiHelper.getRandomnumber()+"&user_id="+usr.id.toString(),mp);

                print(response);


                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.pop(context);
                });


                getWalletPoints();
                getWalletPointsTransaction();




              });


            },),








          ]

          ,),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [

            Expanded(child: Padding(padding: EdgeInsets.all(15),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Icon(Icons.star, color: Colors.orange, size: 60),
                    SizedBox(height: 5,),
                    Text("Purchase Points Balance : "+walletpoints.toString(),style: TextStyle(fontSize: 17,color: Colors.black),),



                  ],
                )




            ),flex: 1,),

            Expanded(child: (data!.length>0)? ListView.builder(
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {

                  // List<String> date=data![index]!.transactionDate.toString().split(" ");
                  // String d=date[0];
                  final dateTime = getFormatedDate(data![index]!.insDate.toString());

                  return Card(

                    child:ListTile(
                      leading:  Icon(Icons.star,color: Colors.black54,size: 30,),
                      trailing: (data![index].debit.toString().compareTo("0")==0 && data![index].credit.toString().compareTo("0")!=0) ?
                      Text(
                        "+"+data![index].credit.toString(),
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ) : Text(
                        "-"+data![index].debit.toString(),
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ),
                      title: Text((data![index].description!=null&& data![index].description!.isNotEmpty)?   data![index]!.description.toString():"Purchase Points"),
                      subtitle: Text(dateTime.toString()),

                    ) ,
                    elevation: 5,
                    margin: EdgeInsets.all(5),
                  )


                  ;
                }) : Stack(
              children: [

                Align(
                  alignment: FractionalOffset.center,
                  child: Text("No data found"),
                )
              ],
            ),flex: 5,)







          ],
        )


    );
  }


  getFormatedDate(String dateString) {
    // String dateString = "2025-03-26 21:39:05"; // Input date string

    // Parse the string into DateTime
    DateTime dateTime = DateTime.parse(dateString);

    // Format DateTime into 12-hour format with AM/PM
    String formattedDate = DateFormat('dd-MM-yyyy hh:mm:ss a').format(dateTime);

    return formattedDate; // Output: 2025-03-26 09:39:05 PM
  }

  getWalletPoints()
  async {
    //getWalletPointsOffice.php

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });



    ApiHelper apiHelper=new ApiHelper();

    String urldata="https://mysaving.in/IntegraAccount/ecommerce_api/getWalletPointsOffice.php?timestamp="+apiHelper.getRandomnumber()+"&user_id="+usr.id;

    print(urldata);
    String response=await apiHelper.getApiResponse(urldata);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });

    var json=jsonDecode(response);
    setState(()  {
      walletpoints=int.parse(json['data'].toString()).toString();



    });

  }

getWalletPointsTransaction()async{
    //getWalletPointsTransactionOffice.php
  WidgetsBinding.instance.addPostFrameCallback((_) {
    ApiHelper.showLoaderDialog(context);
  });



  ApiHelper apiHelper=new ApiHelper();

  String urldata="https://mysaving.in/IntegraAccount/ecommerce_api/getWalletPointsTransactionOffice.php?timestamp="+apiHelper.getRandomnumber()+"&user_id="+usr.id;

  print(urldata);
  String response=await apiHelper.getApiResponse(urldata);
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Navigator.pop(context);
  });

  var json=jsonDecode(response);

  PointsEntity pointsEntity=PointsEntity.fromJson(json);

  if(pointsEntity.status==1)
    {
      setState(() {
        data!.clear();
        data!.addAll(pointsEntity.data!);


      });



    }


}


  Future<void> showAmountDialog(BuildContext context, Function(String) onSubmit) async {
    final TextEditingController amountController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text("Enter points"),
          content: TextField(
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: false),
            decoration: InputDecoration(
              hintText: "Enter points",
              prefixIcon: Icon(Icons.currency_rupee),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                String value = amountController.text.trim();
                if (value.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter an amount")),
                  );
                } else {
                  Navigator.pop(context);
                  onSubmit(value); // send back the entered value
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }



}
