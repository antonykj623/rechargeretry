import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/web/ApiMethodes.dart';

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

  _ProtrackerDetailsState(this.pro,this.usr) ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getWalletPoints();
  }


  getWalletPoints()
  async {
    //getWalletPointsOffice.php

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });



    ApiHelper apiHelper=new ApiHelper();

    String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.getWalletPointsOffice+"?timestamp="+apiHelper.getRandomnumber()+"&user_id="+usr.id;

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


    child:    Column(

      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [

        Text("\n\n\nName : "+pro.data!.productName.toString()+"\nDescription : "+pro.data!.productDescription.toString()+"\nProduct. Code : "+pro.data!.productCode.toString(),style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)

        ,Container(height: 30,),

        QuantitySelector(
          initialValue: 1,
          min: 1,
          max: 10,
          onChanged: (value) {
            print("Quantity: $value");
          },
        ),




        Padding(padding: EdgeInsets.all(20),

          child: Container(
    width: 150,
    height: 60,
    color: Colors.blue,

    child: TextButton(onPressed: () async {

     double ppredemption = double.parse(
          pro.data!.ppRedemption
              .toString());
     double wp=double.parse(walletpoints);

      if (wp >= ppredemption) {
        Widget okButton = TextButton(
          child: Text("Yes"),
          onPressed: () {
         double   tempwalletpoints =
                wp - ppredemption;
            // AppStorage.setString(AppStorage.current_wallet_point, tempwalletpoints.toString());
            ispointredeemeed = true;
            getProductExistsinCart();

            Navigator.pop(context);
          },
        );

        Widget noButton = TextButton(
          child: Text("No"),
          onPressed: () {
            ispointredeemeed = false;
            getProductExistsinCart();

            Navigator.pop(context);
          },
        );

        // set up the AlertDialog
        AlertDialog alert = AlertDialog(
          title: Text("Savekart"),
          content: Text("Your wallet point is " +
              walletpoints.toString() +
              ".So you are eligible to redeem points.Do you want to redeem now ?"),
          actions: [
            okButton,
            noButton
          ],
        );

        // show the dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          },
        );
      }
      else {
        getProductExistsinCart();
      }




    }, child: Text("Create Order",style: TextStyle(fontSize: 16,color: Colors.white),)),

    )




          ,

        )


      ],


    ),

    )



       ,flex: 3,)



        ],
      ),


    );
  }

  getProductExistsinCart() async {

    ApiHelper.showLoaderDialog(context);

    ApiHelper apiHelper=new ApiHelper();

    var response = await apiHelper.getApiResponse(
        ApiMethodeCredentials.ecommerce_baseurl+ ApiMethodeCredentials.chekProductExistsOFFice + "?q=" + apiHelper.getRandomnumber().toString() +
            "&product_id=" + pro.data!.productId.toString()+"&user_id="+usr.id);

    var js = jsonDecode(response);

    Navigator.pop(context);

    CartDataExistEntity exist = CartDataExistEntity.fromJson(js);
    if (exist.data!.length > 0) {
      ApiHelper.showAlertDialog(context,  "Already added to cart");
    }
    else {
      addToCart();
    }
  }
  addToCart()async {

    ApiHelper.showLoaderDialog(context);


    ApiHelper apihelper = new ApiHelper();

    var t=apihelper.getRandomnumber();

    Map<String,String> mp=new HashMap();
    mp['product_id']=pro.data!.productId.toString();
    mp['quantity']="1";
    mp['stockid']=pro.data!.stockid.toString();
    if(ispointredeemeed)
    {
      mp['points_redeemed']="1";
    }
    else{

      mp['points_redeemed']="0";
    }


    var response= await  apihelper.postApiResponse(Apimethodes.addProductToCart+"?q="+t.toString(),formDataPayload: mp);

    var js= jsonDecode( jsonEncode(response) ) ;

    Navigator.pop(context);

    // if(js['status']==1)
    //   {

    getCartCount();






  }
}


