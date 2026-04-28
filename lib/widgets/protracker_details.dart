import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/web/ApiMethodes.dart';
import 'package:recharge_retry/widgets/place_order_pro.dart';

import '../domain/ProfileEntity.dart';
import '../domain/cartDataExist.dart';
import '../domain/protracker_entity.dart';
import '../web/apiservices.dart';
import 'dialogbox/quatityselector.dart';

class ProtrackerDetails extends StatefulWidget {

  UserData usr;

  ProtrackerEntity pro;

   ProtrackerDetails(this.pro,this.usr) ;

  @override
  _ProtrackerDetailsState createState() => _ProtrackerDetailsState(this.pro,this.usr);
}

class _ProtrackerDetailsState extends State<ProtrackerDetails> {



  UserData usr;

  ProtrackerEntity pro;

  String walletpoints="0";

  bool ispointredeemeed=false;
  int qty=1;
  bool isAlreadyexists=false;

  _ProtrackerDetailsState(this.pro,this.usr) ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(padding: EdgeInsets.only(left: 16),
          child:  IconButton(onPressed: (){

            Navigator.pop(context);

          }, icon: Icon(Icons.arrow_back))

        ),



        title:  Text(pro.data!.productName.toString(),style: TextStyle(fontSize: 15),),
        centerTitle: true,

        actions: [


        ],
      ),

      body: Column(
        children: [

          Container(width: double.infinity,
          height: 250,
            child: Row(
              children: [

                Expanded(flex: 1,child: Image.network(ApiMethodeCredentials.productimageurl +
                    pro.data!.primeImage.toString(),width: double.infinity,

                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child; // Image loaded successfully
                    return Center(child: CircularProgressIndicator()); // Show loader while loading
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
                  },

                  fit: BoxFit.fill,


                ) ,),

                Expanded(child: Padding(padding: EdgeInsets.all(15),


                  child:    Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      Text("\n\n\nName : "+pro.data!.productName.toString()+"\nProduct. Code : "+pro.data!.productCode.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)

                      ,Container(height: 30,),

                   QuantitySelector(
                        initialValue: 1,
                        min: 1,
                        max: 10,
                        onChanged: (value) {
                          print("Quantity: $value");

                          setState(() {
                            qty=value;
                          });
                        },
                      )





                    ],


                  ),

                )
                  ,flex: 3,)

              ],
            ),
          )

,

          Padding(padding: EdgeInsets.all(20),

            child: Container(
              width: 150,
              height: 60,
              color: Colors.blue,

              child: TextButton(onPressed: () async {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PlaceOrderPro(usr,pro,qty)),
                );







              }, child: Text("Create Order",style: TextStyle(fontSize: 16,color: Colors.white),)),

            )

            ,

          )








        ],
      ),


    );
  }


}


