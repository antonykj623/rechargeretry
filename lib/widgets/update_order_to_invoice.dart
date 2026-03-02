import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/domain/Protracker_NotInvoice_entity.dart';
import 'package:recharge_retry/web/ApiMethodes.dart';
import 'package:recharge_retry/web/apiservices.dart';

class UpdateOrderToInvoice extends StatefulWidget {

   UpdateOrderToInvoice() ;

  @override
  _UpdateOrderToInvoiceState createState() => _UpdateOrderToInvoiceState();
}

class _UpdateOrderToInvoiceState extends State<UpdateOrderToInvoice> {

  TextEditingController _dateController = TextEditingController();
  String date="";

  List<ProtrackerNotInvoiceData> data_protracker = [];

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
    getProtrackerList(date);

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

         getProtrackerList(date);
      });
    }
  }



  getProtrackerList(String date)async{

    String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.getProtrackerNotInvoice+"?date_selected="+date;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();

String data=await apiHelper.getApiResponse(urldata);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });

    ProtrackerNotInvoiceEntity protrackerNotInvoiceEntity=ProtrackerNotInvoiceEntity.fromJson(jsonDecode(data));

    if(protrackerNotInvoiceEntity.status==1)
      {


        setState(() {

          data_protracker.clear();
          data_protracker.addAll(protrackerNotInvoiceEntity.data!);



        });
      }













  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Padding(

          padding: EdgeInsets.all(10),
          child: IconButton(onPressed: (){

            Navigator.pop(context);


          }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        ),
        title: Text("Save Pro Tracker",style: TextStyle(fontSize: 15,color: Colors.white),)


        ,
        backgroundColor: Color(0xff133B52),

        actions: [



         

        ],
      ),

      body: Column(

        children: [

          Container(height: 20,),

          Text("Save Pro Tracker (Invoice not created)",style: TextStyle(fontSize: 15,color: Colors.black),)
,
          Container(height: 20,),
          Padding(
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
          ),
          Stack(

            children: [

              (data_protracker.length>0)?  ListView.builder(
                itemCount: data_protracker.length,

                padding: EdgeInsets.all(8),
                primary: false,
                shrinkWrap: true,
                // Number of items to display in the list.

                // Builds each item in the list dynamically based on the index.
                itemBuilder: (BuildContext context, int index) {

                  String text="SAVEAPP - Pro Expense Tracker"+"\n Qty : "+data_protracker[index].quantity.toString()+"\n Order ID : "+data_protracker[index].orderId.toString();


                  String subtext="Reg ID : "+data_protracker[index].userId.toString();


                  return Card(
                    
                    child:  ListTile(
                      leading:  Icon(Icons.list), // Icon on the left side of the ListTile.
                      trailing: TextButton(onPressed: () async {


                        String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.createInvoiceByUpdateStatus+"?order_id="+data_protracker[index].orderId.toString();

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ApiHelper.showLoaderDialog(context);
                        });

                        ApiHelper apiHelper=new ApiHelper();

                        String data=await apiHelper.getApiResponse(urldata);

                        WidgetsBinding.instance.addPostFrameCallback((_) {

                          Navigator.pop(context);
                        });

                        getProtrackerList(date);


                      }, child:  Text(
                        "Create Invoice", // Text shown on the right side.
                        style: TextStyle(color: Colors.green, fontSize: 12), // Styling the trailing text.
                      ))



                     ,
                      title: Text(text,style: TextStyle(fontSize: 14,color: Colors.black),),


                      subtitle: Text(subtext,style: TextStyle(fontSize: 12,color: Colors.black),),

                      // Main title text that shows item index.



                    ),
                    elevation: 5,
                  )
                    
                    
                    
                   ;
                },
              ) : Stack(
                
                children: [
                  
                  Align(
                    alignment: FractionalOffset.center,
                    
                    child: Text("No data found"),
                  )
                ],
              )


            ],
          ),


        ],
      )





    
    
    );
  }






}
