import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/domain/cart_details_entity.dart';

import '../domain/ProfileEntity.dart';
import '../domain/cartDataExist.dart';
import '../domain/protracker_entity.dart';
import '../web/ApiMethodes.dart';
import '../web/apiservices.dart';
import 'dialogbox/quatityselector.dart';

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
  int qty=0;
  int cart_id=0;

  _PlaceOrderProState(this.usr,this.pro);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getProtrackerCart();
  }


  getProtrackerCart()async
  {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();


String ur=ApiMethodeCredentials.ecommerce_baseurl   +ApiMethodeCredentials.getProtrackerCart+"?q="+apiHelper.getRandomnumber()+"&product_id="+pro.data!.productId.toString()+"&user_id="+usr.id.toString();


    WidgetsBinding.instance.addPostFrameCallback((_) {

      Navigator.pop(context);
    });

    String sp=await apiHelper.getApiResponse(ur);

    CartDetailsEntity cartDataExistEntity=CartDetailsEntity.fromJson(jsonDecode(sp));


    if(cartDataExistEntity.status==1)
      {


setState(() {
  qty=int.parse(cartDataExistEntity.data!.quantity.toString());
  cart_id=int.parse(cartDataExistEntity.data!.id.toString());
});



      }




  }

  updateCartQty(int qty)async{

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();




    String ur=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.updateCartQtyOffice+"?q="+apiHelper.getRandomnumber()+"&id="+cart_id.toString()+"&quantity="+qty.toString();


    String sp=await apiHelper.getApiResponse(ur);
    WidgetsBinding.instance.addPostFrameCallback((_) {

      Navigator.pop(context);
    });




    getProtrackerCart();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
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


          Expanded(child:   Padding(
            padding:  EdgeInsets.all(8.0),
            child: Container(
              color: Colors.blue[50],
              width: double.infinity,
              height: 200,// Background color of the container.
              child: ListTile(
                leading:  Image.network(ApiMethodeCredentials.productimageurl +
                    pro.data!.primeImage.toString(),width:100,height: 100,


                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child; // Image loaded successfully
                    return Center(child: CircularProgressIndicator()); // Show loader while loading
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
                  },

                  fit: BoxFit.fill,

                ), // Icon displayed at the start.
                title:  Text(pro.data!.productName.toString(), style: TextStyle(fontSize: 12),), // Main title with increased text size.
                // Icon displayed at the end.
                subtitle:    SizedBox(
                  width: 120,
                  height: 60,
                  child:    QuantitySelector(
                    initialValue: qty,
                    min: 1,
                    max: 10,
                    onChanged: (value) {
                      print("Quantity: $value");

                      // setState(() {
                      //   qty=value;
                      // });

                      updateCartQty(value);





                    },
                  ) ,
                )




                , // Secondary text below the title.
                selected: true, // Visually marks the ListTile as selected.
                // Function executed when the ListTile is tapped.

              ),
            ),
          ),flex: 1, )


       ,
          Expanded(child: Stack(
            children: [

Align(
  alignment: FractionalOffset.topCenter,
  child: ListView.builder(
    itemCount: 5,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        leading:  Icon(Icons.list),

        title: Text("List item $index"), // Main title text that shows item index.
      );
    },
  ),
)


            ],

          ),flex: 3,)













        ],
      ),


    );
  }
}
