import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/widgets/searchuser.dart';

import '../domain/ProfileEntity.dart';
import '../domain/cart_order_details_entity.dart';
import '../domain/cart_order_entity.dart';
import '../web/apiservices.dart';
import 'address_change_screen.dart';

class UserDetailsPage extends StatefulWidget {
  final 	CartOrderDetailsData data;

  final CartOrderData cartOrderData;

   UserDetailsPage(this.data,this.cartOrderData) ;

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState(this.data,this.cartOrderData);
}

class _UserDetailsPageState extends State<UserDetailsPage> {

  UserResponse? usr;


  final 	CartOrderDetailsData data;

  final CartOrderData cartOrderData;

  _UserDetailsPageState(this.data,this.cartOrderData);

  @override
  void initState() {
    super.initState();

    getProfile();

  }


  getProfile()
  async {

    //getProfilebyID.php



    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();

    String response=await apiHelper.getApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/getProfilebyID.php?timestamp="+apiHelper.getRandomnumber()+"&id="+widget.cartOrderData.orderdata!.regId.toString());

    print(response);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });

    var js= jsonDecode(response) ;


    final userResponse = UserResponse.fromJson(js);

    setState(() {

      usr=userResponse;
    });






  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: (usr!=null)? Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Text(
                      usr!.data[0].fullName[0].toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Name: ${usr!.data[0].fullName}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  "Mobile: ${usr!.data[0].mobile}",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "Email: ${usr!.data[0].emailId}",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Text(
                  "RegID: ${usr!.data[0].regCode}",
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                Stack(
                  children: [

                    Align(
                      alignment: FractionalOffset.center,
                      child: TextButton(
                        onPressed: () async {

                          final selectedItem = await showDialog(
                            context: context,
                            builder: (context) => SearchListDialog(),
                          );

                          if (selectedItem != null) {

                            UserData usr=selectedItem as UserData;

                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Important Alert"),
                                  content: Text("You should add new address to change the user in the order data"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {

                                        Navigator.pop(context);
                                        getCurrentAddress(cartOrderData.orderdata!.regId!, usr.id, data.orderId.toString(),data.addressid.toString());
                                      // closes the dialog




                                      },
                                      child: Text("OK"),
                                    ),
                                  ],
                                );
                              },
                            );





                          }



                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // remove default padding
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.blue, // background color
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Change User",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      )
                      ,
                    )
                  ],
                )


              ],
            ),
          ),
        ),
      ) : Padding(padding: EdgeInsets.all(10),

      child: Stack(
        children: [

          Align(
            alignment: FractionalOffset.center,
            child: Text("No data found"),
          )
        ],
      )

      ),
    );
  }


  getCurrentAddress(String userid,String useridtoChage,String orderid,String addressid)
  {



    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddressChangeScreen(userid,useridtoChage,orderid,addressid,cartOrderData,data)
      ),
    );


  }





}
