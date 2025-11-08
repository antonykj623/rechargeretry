import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/web/apiservices.dart';
import 'package:recharge_retry/widgets/recharge_details.dart';
import 'package:recharge_retry/widgets/save_kart_orders.dart';
import 'package:recharge_retry/widgets/savekart_invoice.dart';

import '../domain/recharge_list_entity.dart';

class RechargeListScreen extends StatefulWidget {
   RechargeListScreen() ;

  @override
  _RechargeListScreenState createState() => _RechargeListScreenState();
}

class _RechargeListScreenState extends State<RechargeListScreen> {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  String date="";
  List<RechargeListData> rdata = [];
  List<RechargeListData> filterdata = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DateTime dt=DateTime.now();
    String day="",month="";
  month=  (dt.month>=10)?dt.month.toString():"0"+dt.month.toString();
  day=dt.day>=10 ? dt.day.toString():"0"+dt.day.toString();

  setState(() {
    _dateController.text = "${dt.day}/${dt.month}/${dt.year}";
    date=  dt.year.toString()+"-"+month+"-"+day;
  });






    _getRechargeList(date,true);
  }


 Future<void> _getRechargeList(String date,bool isShow)
  async {

    if(isShow) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ApiHelper.showLoaderDialog(context);
      });
    }

ApiHelper apiHelper=new ApiHelper();
String response=await apiHelper.getApiResponse("https://mysaving.in/easyrecharge/paymentgateway/getRechargeLists.php?q="+apiHelper.getRandomnumber()+"&date="+date);

var json=jsonDecode(response);
    RechargeListEntity rechargeListEntity=RechargeListEntity.fromJson(json);

if(rechargeListEntity.status==1)
  {
    setState(() {

      rdata.clear();
      rdata.addAll(rechargeListEntity.data!);
      filterdata=rdata;
    });


  }
    if(isShow) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }



  }


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? dt = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (dt != null) {
      setState(() {
        _dateController.text = "${dt.day}/${dt.month}/${dt.year}";
        String day="",month="";
        month=  (dt.month>=10)?dt.month.toString():"0"+dt.month.toString();
        day=dt.day>=10 ? dt.day.toString():"0"+dt.day.toString();



        date=  dt.year.toString()+"-"+month+"-"+day;

        _getRechargeList(date,true);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Padding(
          
          padding: EdgeInsets.all(10),
          child: Image.asset("assets/icon.png",width: 30,height: 30,),
        ),
        title: Text("Recharge List",style: TextStyle(fontSize: 15,color: Colors.white),)
        
        
        ,
        backgroundColor: Color(0xff133B52),

        actions: [

          GestureDetector(
            child: IconButton(onPressed: (){

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SaveKartOrders()));




            }, icon: Icon(Icons.shopping_cart,color: Colors.white,size: 30,)),
          ),

          GestureDetector(
            child: IconButton(onPressed: (){

              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InvoiceGroupedScreen()));




            }, icon: Icon(Icons.list_alt,color: Colors.white,size: 30,)),
          )

        ],
      ),

      body: RefreshIndicator(
          onRefresh: () async {
            await _getRechargeList(date, false);
          },
          child: Column(

        children: [

          Expanded(child: Column(
            
            children: [

              SizedBox(height: 10,),
              
              Row(
                children: [
                  Expanded(child:Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: _dateController,
                      readOnly: true, // User can't manually edit
                      decoration: InputDecoration(

                        labelText: "Select Date",
                        border: OutlineInputBorder(),
                      ),
                      onTap: () => _selectDate(context),
                    ),
                  ),flex: 1, ),
                  Expanded(child:Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: _mobileController,
                      keyboardType: TextInputType.phone,
                      // User can't manually edit
                      decoration: InputDecoration(

                        labelText: "Mobile number",
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (txt){

                        if(txt.isNotEmpty) {
                          setState(() {
                            rdata = filterdata
                                .where((item) =>
                                item.accountNumber.toString()
                                    .toLowerCase()
                                    .contains(txt.toLowerCase())
                            )
                                .toList();
                          });
                        }
                        else{
                          setState(() {
                            rdata.clear();
                            rdata.addAll(filterdata);

                          });


                        }

                      },

                    ),
                  ),flex: 1, )
                  
                  
                  
                  
                ],
              )
              
              
              
              
            ],
            
            
            
          ),flex: 1,),

          Expanded(child: Stack(

            children: [

              ListView.builder(
                itemCount: rdata.length, // Number of items to display in the list.

                // Builds each item in the list dynamically based on the index.
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 8,

                    child: Container(
                      width: double.infinity,
                      height: 250,

                      child: Column(

                        children: [

                          Expanded(child: ListTile(
                            leading: (rdata[index].rechargeType.toString().compareTo("1")==0)? Icon(Icons.mobile_friendly):Icon(Icons.satellite_alt) , // Icon on the left side of the ListTile.
                            trailing: TextButton(

                              onPressed: () async {
                                final result  =await Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RechargeDetails(rdata[index])));

                                if (result != null||result==null) {


                                  _getRechargeList(date, true);

                                }


                              },
                              child:Text(
                                "View/Edit", // Text shown on the right side.
                                style: TextStyle(color: Colors.green, fontSize: 15), // Styling the trailing text.
                              ) ,
                            )



                            ,
                            title: Text(rdata[index].fullName.toString()+"\n"+rdata[index].accountNumber.toString()+"\n"+rdata[index].rechargid.toString(),
                              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),

                            ),
                            subtitle: Text("Operator : "+rdata[index].operator.toString()+"\n"+"Amount : "+rdata[index].amount.toString(),

                              style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),

                            ),


                            // Main title text that shows item index.
                          ) ,flex: 2,),

                          Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: (rdata[index].paymentStatus.toString().compareTo("5") == 0)
                                      ? Text(
                                    "Payment Success",
                                    style: TextStyle(fontSize: 14, color: Colors.green),
                                  )
                                      : (rdata[index].paymentStatus.toString().compareTo("4") == 0)
                                      ? Text(
                                    "Payment Initiated",
                                    style: TextStyle(fontSize: 14, color: Colors.blue),
                                  )
                                      : Text(
                                    "Payment Failed",
                                    style: TextStyle(fontSize: 14, color: Colors.redAccent),
                                  ),
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: Center(
                                  child: (rdata[index].status.toString().compareTo("1") == 0)
                                      ? Text(
                                    "Recharge Success",
                                    style: TextStyle(fontSize: 14, color: Colors.green),
                                  )
                                      : (rdata[index].status.toString().compareTo("2") == 0)
                                      ? Text(
                                    "Recharge pending",
                                    style: TextStyle(fontSize: 14, color: Colors.blue),
                                  )
                                      : (rdata[index].status.toString().compareTo("0") == 0)?  Text(
                                    "Recharge Failed",
                                    style: TextStyle(fontSize: 14, color: Colors.redAccent) ,
                                  ) :  Text(
                                    "Refunded",
                                    style: TextStyle(fontSize: 14, color: Colors.redAccent) ,
                                  ),
                                ),
                              ),
                            ],
                          )
                            ,flex: 1,),

                          (rdata[index].status.toString().compareTo("1")!=0 &&
                              rdata[index].paymentStatus.toString().compareTo("5")==0 && (rdata[index].status.toString().compareTo("3") != 0))?
                          Expanded(child: Padding(

                  padding: EdgeInsets.all(5),
                  child:   Container(
                    width: double.infinity,
                    height: 40,
                    color: Colors.redAccent,
                    child:TextButton(
                      onPressed: () async {

                        ApiHelper.showLoaderDialog(context);


                        ApiHelper apiHelper=new ApiHelper();

                        String response=await apiHelper.getApiResponse("https://mysaving.in/easyrecharge/paymentgateway/retryrechargetest.php?timestamp="+apiHelper.getRandomnumber()+"&transactionid="+rdata[index].rechargid.toString());

                        Navigator.pop(context);
                        _getRechargeList(date, false);

    showDialog(
    context: context,
    builder: (context) {
    return AlertDialog(
    title: Text("Updated Result"),
    content: SizedBox(
    height: 200, // Set height to limit dialog size
    width: double.maxFinite,
    child: SingleChildScrollView(
    child: Text(
   response,
    style: TextStyle(fontSize: 16),
    ),
    ),
    ),
    actions: [
    TextButton(
    child: Text("Close"),
    onPressed: () => Navigator.of(context).pop(),
    )
    ],
    );
    },
    );





                      },
                      child: Text("Retry",style: TextStyle(fontSize: 14,color: Colors.white),),
                    ),

                  )
                  )


                            ,flex: 1,) : Container()

                        ],
                      )


                      ,
                    )



                  )


                    ;
                },
              ),


            ],
          ),flex:4,)


        ],
      ) )


    );
  }
}
