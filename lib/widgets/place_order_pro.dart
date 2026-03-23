import 'package:flutter/material.dart';

import '../domain/ProfileEntity.dart';
import '../domain/protracker_entity.dart';
import '../web/ApiMethodes.dart';

class PlaceOrderPro extends StatefulWidget {

  UserData usr;

  ProtrackerEntity pro;



   PlaceOrderPro(this.usr,this.pro) ;

  @override
  _PlaceOrderProState createState() => _PlaceOrderProState(this.usr,this.pro);
}

class _PlaceOrderProState extends State<PlaceOrderPro> {


  UserData usr;

  ProtrackerEntity pro;
  _PlaceOrderProState(this.usr,this.pro);

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
          Expanded(child: Image.network(ApiMethodeCredentials.productimageurl +
              pro.data!.primeImage.toString(),width: double.infinity,

            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child; // Image loaded successfully
              return Center(child: CircularProgressIndicator()); // Show loader while loading
            },
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
            },

            fit: BoxFit.fill,

          ) ,flex: 1,),


          Expanded(child: Padding(padding: EdgeInsets.all(15),


            // child:    Column(
            //
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //
            //   children: [
            //
            //     Text("\n\n\nName : "+pro.data!.productName.toString()+"\nDescription : "+pro.data!.productDescription.toString()+"\nProduct. Code : "+pro.data!.productCode.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
            //
            //     ,Container(height: 30,),
            //
            //     QuantitySelector(
            //       initialValue: 1,
            //       min: 1,
            //       max: 10,
            //       onChanged: (value) {
            //         print("Quantity: $value");
            //
            //         setState(() {
            //           qty=value;
            //         });
            //       },
            //     ),
            //
            //
            //
            //
            //     (isAlreadyexists)? Padding(padding: EdgeInsets.all(20),
            //
            //       child: Container(
            //         width: 150,
            //         height: 60,
            //         color: Colors.blue,
            //
            //         child: TextButton(onPressed: () async {
            //
            //
            //
            //
            //
            //
            //         }, child: Text("Go to Cart",style: TextStyle(fontSize: 16,color: Colors.white),)),
            //
            //       )
            //
            //
            //
            //
            //       ,
            //
            //     )   :  Padding(padding: EdgeInsets.all(20),
            //
            //       child: Container(
            //         width: 150,
            //         height: 60,
            //         color: Colors.blue,
            //
            //         child: TextButton(onPressed: () async {
            //
            //           double ppredemption = double.parse(
            //               pro.data!.ppRedemption
            //                   .toString());
            //           double wp=double.parse(walletpoints);
            //
            //           if (wp >= ppredemption) {
            //             Widget okButton = TextButton(
            //               child: Text("Yes"),
            //               onPressed: () {
            //                 double   tempwalletpoints =
            //                     wp - ppredemption;
            //                 // AppStorage.setString(AppStorage.current_wallet_point, tempwalletpoints.toString());
            //                 ispointredeemeed = true;
            //                 getProductExistsinCart(true);
            //
            //                 Navigator.pop(context);
            //               },
            //             );
            //
            //             Widget noButton = TextButton(
            //               child: Text("No"),
            //               onPressed: () {
            //                 ispointredeemeed = false;
            //                 getProductExistsinCart(true);
            //
            //                 Navigator.pop(context);
            //               },
            //             );
            //
            //             // set up the AlertDialog
            //             AlertDialog alert = AlertDialog(
            //               title: Text("Savekart"),
            //               content: Text("Your wallet point is " +
            //                   walletpoints.toString() +
            //                   ".So you are eligible to redeem points.Do you want to redeem now ?"),
            //               actions: [
            //                 okButton,
            //                 noButton
            //               ],
            //             );
            //
            //             // show the dialog
            //             showDialog(
            //               context: context,
            //               builder: (BuildContext context) {
            //                 return alert;
            //               },
            //             );
            //           }
            //           else {
            //             getProductExistsinCart(true);
            //           }
            //
            //
            //
            //
            //         }, child: Text("Create Order",style: TextStyle(fontSize: 16,color: Colors.white),)),
            //
            //       )
            //
            //
            //
            //
            //       ,
            //
            //     )
            //
            //
            //   ],
            //
            //
            // ),

          )



            ,flex: 3,)



        ],
      ),


    );
  }
}
