import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/domain/walletbalance.dart';
import 'package:recharge_retry/domain/wallettransactions.dart';

import '../domain/ProfileEntity.dart';
import '../web/apiservices.dart';

class WalletBalance extends StatefulWidget {

  UserData userd;


   WalletBalance(this.userd) ;

  @override
  _WalletBalanceState createState() => _WalletBalanceState(this.userd);
}

class _WalletBalanceState extends State<WalletBalance> {


  UserData userd;

  String walletbalance="0";
  List<WalletTransactionData>? data = [];


  _WalletBalanceState(this.userd);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWalletBalance();
    getwalletTransactionsForOffice();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(userd.fullName+"\n"+userd.mobile  ,style: TextStyle(fontSize: 17,color: Colors.white),),
        leading: GestureDetector(

          child:Icon(Icons.arrow_back,color: Colors.white,size:25 ,) ,

          onTap: (){

            Navigator.pop(context);
          },
        ),
        backgroundColor: Color(0xff0B7D97),
        actions: [

          IconButton(icon: Icon(Icons.add,color: Colors.white,), onPressed: () {

            showAmountDialog(context, (amount) async {
              print("User entered: ₹$amount");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("You entered ₹$amount")),
              );

              //changeWalletAmount.php

              WidgetsBinding.instance.addPostFrameCallback((_) {
                ApiHelper.showLoaderDialog(context);
              });

              Map<String,String>mp={"user_id":userd.id,"amount":amount,"purpose":"Add"};

              ApiHelper apiHelper=new ApiHelper();

              String response=await apiHelper.postApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/changeWalletAmount.php?timestamp="+apiHelper.getRandomnumber()+"&user_id="+userd.id.toString(),mp);

              print(response);


              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pop(context);
              });


              getWalletBalance();
              getwalletTransactionsForOffice();




            });


          },),

          IconButton(icon: Icon(Icons.remove,color: Colors.white,), onPressed: () {

            showAmountDialog(context, (amount) async {
              print("User entered: ₹$amount");
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("You entered ₹$amount")),
              );

              //changeWalletAmount.php

              WidgetsBinding.instance.addPostFrameCallback((_) {
                ApiHelper.showLoaderDialog(context);
              });

              Map<String,String>mp={"user_id":userd.id,"amount":amount,"purpose":"Reduce"};

              ApiHelper apiHelper=new ApiHelper();

              String response=await apiHelper.postApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/changeWalletAmount.php?timestamp="+apiHelper.getRandomnumber()+"&user_id="+userd.id.toString(),mp);

              print(response);


              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pop(context);
              });


              getWalletBalance();
              getwalletTransactionsForOffice();



            });


          },),






        ]

        ,),
      
      body: Column(
        children: [
          
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              SizedBox(height: 5,),
              Text("Wallet Balance : "+walletbalance.toString(),style: TextStyle(fontSize: 17,color: Colors.black),),



            ],
          ),flex: 1,),
          
          
          Expanded(child: (data!.length>0)? ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {

                // List<String> date=data![index]!.transactionDate.toString().split(" ");
                // String d=date[0];
                final dateTime = DateTime.parse(data![index]!.transactionDate.toString());

                return Card(

                  child:ListTile(
                    leading:  Icon(Icons.wallet,color: Colors.black54,size: 30,),
                    trailing: (data![index].debit.toString().compareTo("0")==0 && data![index].credit.toString().compareTo("0")!=0) ?
                    Text(
                      "+"+data![index].credit.toString(),
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ) : Text(
                      "-"+data![index].debit.toString(),
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    title: Text(data![index]!.description.toString()),
                    subtitle: Text(dateTime.day.toString()+"-"+dateTime.month.toString()+"-"+dateTime.year.toString()),

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
          ),flex: 4,)
          
          
          
          
        ],
      ),
      
      
    );
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
          title: Text("Enter Amount"),
          content: TextField(
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: "Enter amount",
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






  getWalletBalance()async{

    //getWalletbalanceforoffice.php

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();

    String response=await apiHelper.getApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/getWalletbalanceforoffice.php?timestamp="+apiHelper.getRandomnumber()+"&user_id="+userd.id.toString());

    print(response);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });


    WalletBalanceEntity walletBalanceEntity=WalletBalanceEntity.fromJson(jsonDecode(response));


    if(walletBalanceEntity.status==1)
      {


        setState(() {

          walletbalance=walletBalanceEntity.data!.balance;
        });
      }



  }


  getwalletTransactionsForOffice() async {

    //getwalletTransactionsForOffice.php

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();

    String response=await apiHelper.getApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/getwalletTransactionsForOffice.php?timestamp="+apiHelper.getRandomnumber()+"&user_id="+userd.id.toString());

    print(response);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });

    WalletTransactionEntity walletTransactionEntity=WalletTransactionEntity.fromJson(jsonDecode(response));

    if(walletTransactionEntity.status==1)
      {
        if(walletTransactionEntity.data!.length>0)
        {
          setState(() {
            data!.clear();

            data!.addAll(walletTransactionEntity.data!.reversed);
          });
        }

      }





  }




}
