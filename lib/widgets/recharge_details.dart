import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/web/apiservices.dart';

import '../domain/recharge_list_entity.dart';
import '../domain/update_status_entity.dart';

class RechargeDetails extends StatefulWidget {
  RechargeListData rechargeListData;
   RechargeDetails(this.rechargeListData) ;

  @override
  _RechargeDetailsState createState() => _RechargeDetailsState(this.rechargeListData);
}

class _RechargeDetailsState extends State<RechargeDetails> {

  RechargeListData rechargeListData;

  String selectedOperator="Airtel";

  String refunddate="",refundtransaction_id="",selectedpayment_status="",selectedrecharge_status="",selected_genstatus="";



  TextEditingController _mobileController = TextEditingController();
  TextEditingController _amountcontroller = TextEditingController();

  TextEditingController _transactionid = TextEditingController();

List<String> arroperators = ["Airtel", "Vi", "Jio", "BSNL","Airtel dth",
  "Dish TV",
  "Sun Direct","Tata Sky",
  "Videocon"];
  List<String> arroperator_code = ["AT", "ID", "RJ", "CG","AD",
  "DT",
  "SD","TS",
  "VD"];
  List<String> arrspkey = ["3", "37", "116", "4","51","53","54","55","56"];


  List<String>payment_status=["Payment Success","Payment Failed","Payment Initated"];

  List<String>recharge_status=["Recharge Success","Recharge Failed","Recharge Initated","Amount Refunded"];

  List<String>gen_status=["Success","Failed"];

  String? selectedOption = "Mobile Recharge";



  _RechargeDetailsState(this.rechargeListData);



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _mobileController.text=rechargeListData.accountNumber.toString();
      _amountcontroller.text=rechargeListData.rechargeamount.toString();
      selectedOperator=rechargeListData.operator.toString();

      if(rechargeListData.paymentStatus.toString().compareTo("5")==0)
        {
          selectedpayment_status="Payment Success";
        }
     else if(rechargeListData.paymentStatus.toString().compareTo("6")==0)
      {
        selectedpayment_status="Payment Failed";
      }
     else{
        selectedpayment_status="Payment Initated";

      }



      if(rechargeListData.status.toString().compareTo("1")==0)
      {
        selectedrecharge_status="Recharge Success";
      }
      else if(rechargeListData.status.toString().compareTo("0")==0)
      {
        selectedrecharge_status="Recharge Failed";
      }
      else if(rechargeListData.status.toString().compareTo("2")==0){
        selectedrecharge_status="Recharge Initated";

      }
      else if(rechargeListData.status.toString().compareTo("3")==0){
        selectedrecharge_status="Amount Refunded";
      }


      if(rechargeListData.genStatus.toString().compareTo("1")==0)
      {
        selected_genstatus="Success";
      }
      else if(rechargeListData.genStatus.toString().compareTo("0")==0)
      {
        selected_genstatus="Failed";
      }

      if(rechargeListData.rechargeType.toString().compareTo("1")==0)
        {
          selectedOption="Mobile Recharge";
        }
      else{
        selectedOption="DTH Recharge";
      }



    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Padding(

          padding: EdgeInsets.all(10),
          child: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: () {

              Navigator.pop(context);
          },
          ),
        ),
        title: Text("Recharge Details ID : "+rechargeListData.rechargid.toString(),style: TextStyle(fontSize: 15,color: Colors.white),)


        ,
        backgroundColor: Color(0xff133B52),

        actions: [

          Padding(padding: EdgeInsets.all(15),

          child: IconButton(icon: Icon(Icons.check,size: 30,color: Colors.white,), onPressed: () {

            submitUpdate();

          },),


          )


        ],
      ),

      body: SingleChildScrollView(

        child: Column(

          children: [

            SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(0.0),
          child:Row(

            children: [


              Expanded(child:  ListTile(
                title: Text("Mobile Recharge"),
                leading: Radio<String>(
                  value: "Mobile Recharge",
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
              ),flex: 1,),

              Expanded(child:  ListTile(
                title: Text("DTH Recharge"),
                leading: Radio<String>(
                  value: "DTH Recharge",
                  groupValue: selectedOption,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
              ),flex: 1,)
              
            ],
          )),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _mobileController,
                keyboardType: TextInputType.phone,
                // User can't manually edit
                decoration: InputDecoration(

                  labelText: "Mobile/card no.",
                  border: OutlineInputBorder(),
                ),
                onChanged: (txt){



                },

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: _amountcontroller,
                keyboardType: TextInputType.phone,
                // User can't manually edit
                decoration: InputDecoration(

                  labelText: "Amount",
                  border: OutlineInputBorder(),
                ),
                onChanged: (txt){



                },

              ),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),

                child: Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:DropdownButton<String>(
                  hint: Text('Select an operator'),
                  value: selectedOperator,
                      isExpanded: true,
                      underline: SizedBox(),
                  items: arroperators.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedOperator = newValue!;
                    });
                  },

              )),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),

              child: Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child:DropdownButton<String>(
                hint: Text('Select Payment Status'),
                value: selectedpayment_status,
                    isExpanded: true,
                    underline: SizedBox(),
                items: payment_status.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedpayment_status = newValue!;
                  });
                },

              )),
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),

              child:Container(
                width: double.infinity,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                hint: Text('Select Recharge Status'),
                value: selectedrecharge_status,
                  isExpanded: true,
                  underline: SizedBox(),
                items: recharge_status.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedrecharge_status = newValue!;
                  });
                },

              )),
            ),

            (selectedrecharge_status.compareTo("Amount Refunded")==0)?  Padding(
              padding: const EdgeInsets.all(15.0),

              child:TextField(
                controller: _transactionid,
                keyboardType: TextInputType.phone,
                // User can't manually edit
                decoration: InputDecoration(

                  labelText: "Refund transaction ID",
                  border: OutlineInputBorder(),
                ),
                onChanged: (txt){



                },

              ),
            ):Container(),

        Padding(
          padding: const EdgeInsets.all(15.0),

          child: Row(

            children: [

              Expanded(child: Text("Gen Status : "),flex: 1,),

              Expanded(child:Container(
                  width: double.infinity,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton<String>(
                hint: Text('Select Gen Status'),
                value: selected_genstatus,
                isExpanded: true,
                underline: SizedBox(),
                items: gen_status.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selected_genstatus = newValue!;
                  });
                },

              ) ),flex: 3,)


            ],
          )



        )


          ],
        ),
      ),
    );
  }


  submitUpdate()async
  {

    int paymentstatus=0,rechargestatus=0,genstatus=0,rechargetype=0;

     if (selectedpayment_status=="Payment Success")
       {
         paymentstatus=5;
    }
    else if(selectedpayment_status=="Payment Failed")
    {

      paymentstatus=6;
    }
    else{
      paymentstatus=4;

    }



    if(selectedrecharge_status=="Recharge Success")
    {
   rechargestatus=1;
    }
    else if(selectedrecharge_status=="Recharge Failed")
    {
      rechargestatus=0;
    }
    else if(selectedrecharge_status=="Recharge Initated"){
      rechargestatus=2;

    }
    else if(selectedrecharge_status=="Amount Refunded"){
      rechargestatus=3;
    }


    if( selected_genstatus=="Success")
    {
     genstatus=1;
    }
    else
    {
genstatus=0;
    }

    if( selectedOption=="Mobile Recharge")
    {
      rechargetype=1;
    }
    else
    {
      rechargetype=2;
    }

    int index = arroperators.indexOf(selectedOperator);
    String operatorCode ="";

    if (index != -1) {
       operatorCode = arrspkey[index];

    }


    if(_mobileController.text.isNotEmpty)
      {

        if(_amountcontroller.text.isNotEmpty)
        {

          Map<String,String>mp=new HashMap();

          mp["rechargetype"]=rechargetype.toString();
          mp["accountnumber"]=_mobileController.text.trim();
          mp["amount"]=_amountcontroller.text.trim();
          mp["operator"]=selectedOperator;
          mp["Spkey"]=operatorCode;
          mp["payment_status"]=paymentstatus.toString();
          mp["recharge_status"]=rechargestatus.toString();
          mp["gen_status"]=genstatus.toString();
          mp["refund_transaction_id"]=_transactionid.text.trim();
          mp["id"]=rechargeListData.rechargid.toString();




          ApiHelper.showLoaderDialog(context);


          ApiHelper apiHelper=new ApiHelper();

          String response=await apiHelper.postApiResponse("https://mysaveapp.com/easyrecharge/paymentgateway/updateRechargeDetails.php?timestamp="+apiHelper.getRandomnumber(),mp);

          Navigator.pop(context);

          UpdateStatusEntity updateStatusEntity=UpdateStatusEntity.fromJson(jsonDecode(response));

          if(updateStatusEntity.status==1)
            {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Details Updated"),
                  duration: Duration(seconds: 1), // Show for 3 seconds
                ),
              );

              submit_statusUpdation(rechargestatus,genstatus);
            }
          else{

            ApiHelper.showAlertDialog(context, "Details updation failed");
          }




          //


        }
        else{

          ApiHelper.showAlertDialog(context, "Please enter amount");

        }
      }
    else{

      ApiHelper.showAlertDialog(context, "Please enter mobile number");

    }




  }


  submit_statusUpdation(int rechargestatus,int genstatus) async {

    ApiHelper.showLoaderDialog(context);


    ApiHelper apiHelper=new ApiHelper();

    String response=await apiHelper.getApiResponse("https://mysaveapp.com/easyrecharge/paymentgateway/updateRechargeStatus.php?timestamp="+apiHelper.getRandomnumber()+"&status="+rechargestatus.toString()+"&id="+rechargeListData.rechargid.toString());

    Navigator.pop(context);

    UpdateStatusEntity updateStatusEntity=UpdateStatusEntity.fromJson(jsonDecode(response));

    if(updateStatusEntity.status==1)
    {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Recharge Status Updated"),
          duration: Duration(seconds: 1), // Show for 3 seconds
        ),
      );

      submitgenstatus(genstatus);

    }
    else{

      ApiHelper.showAlertDialog(context, "Details updation failed");
    }

  }


submitgenstatus(int genstatus)
async {

  ApiHelper.showLoaderDialog(context);


  ApiHelper apiHelper=new ApiHelper();

  String response=await apiHelper.getApiResponse("https://mysaveapp.com/easyrecharge/paymentgateway/updateGenStatus.php?timestamp="+apiHelper.getRandomnumber()+"&status="+genstatus.toString()+"&id="+rechargeListData.rechargid.toString());

  Navigator.pop(context);

  UpdateStatusEntity updateStatusEntity=UpdateStatusEntity.fromJson(jsonDecode(response));

  if(updateStatusEntity.status==1)
  {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Generation  Status Updated"),
        duration: Duration(seconds: 1), // Show for 3 seconds
      ),
    );


  }
  else{

    ApiHelper.showAlertDialog(context, "Details updation failed");
  }
}





}
