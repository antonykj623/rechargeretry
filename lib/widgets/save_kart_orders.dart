import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/domain/cart_order_details_entity.dart';
import 'package:recharge_retry/domain/cart_order_entity.dart';
import 'package:intl/intl.dart';
import 'package:recharge_retry/widgets/savekart_order_details.dart';
import 'package:recharge_retry/widgets/searchuser.dart';
import 'package:recharge_retry/widgets/wallet_balance.dart';
import 'package:recharge_retry/widgets/wallet_points.dart';
import '../domain/ProfileEntity.dart';
import '../web/apiservices.dart';

class SaveKartOrders extends StatefulWidget {
   SaveKartOrders() ;

  @override
  _SaveKartOrdersState createState() => _SaveKartOrdersState();
}

class _SaveKartOrdersState extends State<SaveKartOrders> with SingleTickerProviderStateMixin {
  TextEditingController _dateController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  String date="";
  List<CartOrderData> rdata = [];
  List<CartOrderData> filterdata = [];



  int initiated=0,packing=1,initiateshipping=4,confirmshipping=5,confirmdelivery=6;

  int current_orderstatus=0,current_initiatedstatus=0;
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






getCartOrder(date);
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





        getCartOrder(date);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Savekart Orders",style: TextStyle(color: Colors.white,fontSize: 13),
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,), onPressed: () { Navigator.pop(context); },),
        backgroundColor: Color(0xff133B52),

        actions: [

          IconButton(icon: Icon(Icons.add,color: Colors.white,), onPressed: () {


            getUserDetails(2);




          },),


      IconButton(icon: Icon(Icons.wallet,color: Colors.white,), onPressed: () {

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Choose an option"),
              content: Text("Select one of the following actions."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);

                    getUserDetails(0);


                  },
                  child: Text("Wallet Balance"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    getUserDetails(1);
                  },
                  child: Text("Wallet Points"),
                ),

              ],
            );
          },
        );



      },),





          IconButton(icon: Icon(Icons.refresh,color: Colors.white,), onPressed: () {

           getCartOrder(date);


            },),

        ],

      ),

      body: Column(

        children: [

          Expanded(child:        Row(
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

                    labelText: "Search by Order ID",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (txt){

                    if(txt.isNotEmpty) {
                      setState(() {
                        rdata = filterdata
                            .where((item) =>
                            item.orderdata!.id.toString()
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
          ),flex: 1,),

          Expanded(child: Padding(

            padding: EdgeInsets.only(top: 5),
            child: (rdata.length>0)? ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: rdata.length, // Number of items to display in the list.

              // Builds each item in the list dynamically based on the index.
              itemBuilder: (BuildContext context, int index) {

                CartOrderData crdata=rdata[index];
                String dateStr = crdata.orderdata!.dateOrder.toString();
                DateTime dateTime = DateTime.parse(dateStr);
                String formatted = DateFormat('dd-MM-yyyy hh:mm a').format(dateTime);

                return Card(
                  margin: EdgeInsets.all(8),
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(


                    title: Text('Order ID: ${crdata.orderdata!.id.toString()}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Date: $formatted'),
                        Text('Name : ${crdata.orderdata!.fullName}'),
                        Text('Registered Mob : ${crdata.orderdata!.registeredOb}'),
                        Text('Total Price: ₹${crdata.orderdata!.totalprice}'),
                        Text('Paid: ₹${crdata.orderdata!.paidAmount}'),
                        Text('Used Wallet Amount: ₹${crdata.orderdata!.usedWalletAmount}'),
                        Text('Payment Status: ${crdata.orderdata!.paymentStatus.toString() == "1" ? "Paid" : (crdata.orderdata!.paymentStatus.toString() == "0" ? "Failed":"Pending") }',style: TextStyle(color: crdata.orderdata!.paymentStatus.toString() == "1" ? Colors.green : (crdata.orderdata!.paymentStatus.toString() == "0" ? Colors.red:Colors.amber
                            ),))
                      ],
                    ),
                    trailing: GestureDetector(

                      child:    Icon(Icons.arrow_forward_ios),
                      onTap: (){

                        showOrderDetails(crdata);


                      },


                    )



                    ,
                  ),
                );
              },
            ) : Stack(
              children: [
                Align(alignment: FractionalOffset.center,

                  child: Text("No data found"),
                )
              ],
            )
            ,
          ),





         flex: 4,)

        ],
      ),


    );
  }



  getUserDetails(int code)async
  {
    final selectedItem = await showDialog(
      context: context,
      builder: (context) => SearchListDialog(),
    );

    if (selectedItem != null) {

      UserData usr=selectedItem as UserData;


      if (code==0) {

        //wallet balance

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WalletBalance(usr),
          ),
        );

      }

      else if(code==1){

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WalletPoints(usr),
          ),
        );
      }
      else{


      }





    }

  }





  showOrderDetails(CartOrderData cartOrderData)
  async {
    ApiHelper.showLoaderDialog(context);
    ApiHelper apiHelper=new ApiHelper();
    CartOrderData crdata=cartOrderData;
    String dateStr = crdata.orderdata!.dateOrder.toString();
    DateTime dateTime = DateTime.parse(dateStr);
    String formatted = DateFormat('dd-MM-yyyy hh:mm a').format(dateTime);
    String urldata="https://mysaving.in/IntegraAccount/ecommerce_api/getOrderItemDetails.php?orderid="+crdata.orderdata!.id.toString()+"&timestamp="+apiHelper.getRandomnumber();
    String response=await apiHelper.getApiResponse(urldata);

      Navigator.pop(context);


    var json=jsonDecode(response);

    CartOrderDetailsEntity response1=CartOrderDetailsEntity.fromJson(json);

    if(response1.status==1)
      {



      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => OrderDetailsPage(data: response1.data!,orderdate: formatted,cartOrderData: cartOrderData,),
        ),
      );






      }
    else{

      ApiHelper.showAlertDialog(context, "No details found");
    }





  }






  getCartOrder(String dateorder)
  async {



      WidgetsBinding.instance.addPostFrameCallback((_) {
        ApiHelper.showLoaderDialog(context);
      });



    ApiHelper apiHelper=new ApiHelper();

    String urldata="https://mysaving.in/IntegraAccount/ecommerce_api/getOrderWithAddress.php?timestamp="+apiHelper.getRandomnumber()+"&dateorder="+dateorder;

    print(urldata);
    String response=await apiHelper.getApiResponse(urldata);
      WidgetsBinding.instance.addPostFrameCallback((_) {
Navigator.pop(context);
      });

    var json=jsonDecode(response);

    setState(() {
      rdata.clear();
      filterdata.clear();
    });

    CartOrderEntity entity=CartOrderEntity.fromJson(json);

    if(entity.status==1)
      {
        setState(() {
          // rdata.clear();
          // filterdata.clear();
          rdata.addAll(entity.data!);
          filterdata=rdata;
        });
      }
    else{

      ApiHelper.showAlertDialog(context, "No data found");
    }

  }
}
