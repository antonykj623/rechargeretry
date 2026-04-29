import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/domain/cart_details_entity.dart';
import 'package:recharge_retry/widgets/service_dashboard.dart';

import '../domain/ProfileEntity.dart';
import '../domain/cartDataExist.dart';
import '../domain/protracker_entity.dart';
import '../web/ApiMethodes.dart';
import '../web/apiservices.dart';
import 'dialogbox/quatityselector.dart';

import 'package:http/http.dart' as http;

class PlaceOrderPro extends StatefulWidget {

  UserData usr;

  ProtrackerEntity pro;

  int qty;



   PlaceOrderPro(this.usr,this.pro,this.qty) ;

  @override
  _PlaceOrderProState createState() => _PlaceOrderProState(this.usr,this.pro,this.qty);
}

class _PlaceOrderProState extends State<PlaceOrderPro> {


  UserData usr;

  ProtrackerEntity pro;
  int qty;

  List addressList=[];

  final List<String> countries = [
    'India'

  ];

  final List<String> states = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'West Bengal',
    'Andaman and Nicobar Islands',
    'Chandigarh',
    'Dadra and Nagar Haveli and Daman and Diu',
    'Delhi (National Capital Territory)',
    'Jammu and Kashmir',
    'Ladakh',
    'Lakshadweep',
    'Puducherry'


  ];

  String selectedCountry="India";
  String selectedState="Kerala";

  _PlaceOrderProState(this.usr,this.pro,this.qty);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddressList();


  }


  Future<void> getAddressList() async {


    ApiHelper apiHelper=new ApiHelper();



    final url = Uri.parse(
      "https://mysaving.in/IntegraAccount/ecommerce_api_web/getAddressList.php?userid="+usr.id+"&q="+apiHelper.getRandomnumber(),
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData["status"] == 1) {
          setState(() {
            addressList = jsonData["data"];
            //loading = false;
          });
        } else {
          setState(() {
//loading = false;
          });
        }
      }
    } catch (e) {
      setState(() {
        //loading = false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        title: Text(
          pro.data!.productName.toString(),
          style: const TextStyle(fontSize: 15),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {



          /// ---------------- MOBILE VIEW ----------------
        return  Column(
            children: [

              /// PRODUCT CARD
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: Row(
                    children: [

                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          ApiMethodeCredentials.productimageurl +
                              pro.data!.primeImage.toString(),
                          width: 90,
                          height: 90,
                          fit: BoxFit.cover,

                          loadingBuilder:
                              (context, child, progress) {
                            if (progress == null) return child;
                            return const SizedBox(
                              width: 90,
                              height: 90,
                              child: Center(
                                child:
                                CircularProgressIndicator(),
                              ),
                            );
                          },

                          errorBuilder:
                              (context, error, stackTrace) {
                            return const Icon(
                              Icons.image,
                              size: 70,
                              color: Colors.grey,
                            );
                          },
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              pro.data!.productName.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight:
                                FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow:
                              TextOverflow.ellipsis,
                            ),

                            const SizedBox(height: 10),

                            Text(
                              "Quantity : $qty",
                              style: const TextStyle(
                                fontSize: 13,
                              ),


                            )

                            ,

                Text(
                  "Total Price : ${qty*double.parse(pro.data!.priceSales.toString())}",
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                )
                  ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              /// ADDRESS TITLE
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [

                    const Expanded(
                      child: Text(
                        "Select Address",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {


                        showAddAddressDialog(context);

                      },
                      icon: const Icon(Icons.add),
                    )
                  ],
                ),
              ),

              /// ADDRESS LIST
              Expanded(
                child: (addressList.length>0)? ListView.builder(
                  itemCount: addressList.length,
                  itemBuilder: (context, index) {

                    final item=addressList[index];


                    return    GestureDetector(

                      child:Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading:
                          Icon(Icons.location_on),
                          title: Text(
                            item["name"],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "${item["housename"]}, ${item["flatno"]}"),
                              Text(item["landmark"]),
                              Text(
                                  "${item["place"]}, ${item["district"]}"),
                              Text(
                                  "${item["state"]} - ${item["pincode"]}"),
                              Text("Phone: ${item["phone"]}"),
                            ],
                          ),

                          trailing:  Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                        ),
                      ) ,

                      onTap: () async {

                        ApiHelper.showLoaderDialog(context);
                        Map<String,String> mp=new HashMap();
                        mp['address_id']=item["id"].toString();
                        mp['totalprice']=(qty*double.parse(pro.data!.priceSales.toString())).toString();
                        mp['isWalletUsed']="0";
                        mp['paid_amount']=(qty*double.parse(pro.data!.priceSales.toString())).toString();
                        mp['payment_type']="4";
                        mp['wallet_amount_used']="0";
                        mp["quantity"]=qty.toString();
                        mp["user_id"]=usr.id.toString();
                        ApiHelper apiHelper=new ApiHelper();
                        String response=await apiHelper.postApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api_web/createComplimentryOrder.php"+"?timestamp="+apiHelper.getRandomnumber(),mp);
                        Navigator.pop(context);
                        print(response);
//String d = jsonDecode(response);
                        Map<String, dynamic> data=  jsonDecode(response)  ;
                        if(data['status']==1) {
                          String idTransaction = data['data'].toString();
                        String  orderid=idTransaction.toString();
                          showOrderDialog(context, true, "\nORDER ID : "+orderid+"\n Your order placed successfully!");


                          String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.createInvoiceByUpdateStatus+"?order_id="+orderid;



                          ApiHelper apiHelper=new ApiHelper();

                          String data1=await apiHelper.getApiResponse(urldata);






                        }




                      },
                    )




                      ;
                  },
                ) : Container(
                  width: double.infinity,
                  height: 250,
                  child: Align(
                    alignment: FractionalOffset.center,
                    child: Text("No data found"),
                  ),
                ),
              ),
            ],
          ) ;



          /// ---------------- TABLET / DESKTOP VIEW ----------------
        },
      ),
    );
  }
  void showOrderDialog(BuildContext context, bool isSuccess, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,

      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Icon(
                isSuccess ? Icons.check_circle : Icons.error,
                color: isSuccess ? Colors.green : Colors.red,
                size: 40,
              ),
              SizedBox(width: 8),
              Text(isSuccess ? 'Order Successful' : 'Order Failed'),
            ],
          ),
          content: Text(message +"\n"+"Name : "+usr.fullName+"\nReg Code : "+usr.regCode),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SaveAppServicesScreen()),
                      (Route<
                      dynamic> route) => false, // Remove all previous routes
                );
              },
            ),
          ],
        );
      },
    );
  }

  void showAddAddressDialog(BuildContext context) {
    final nameController = TextEditingController();
    final houseController = TextEditingController();
    final flatController = TextEditingController();
    final landmarkController = TextEditingController();
    final placeController = TextEditingController();
    final districtController = TextEditingController();
    final phoneController = TextEditingController();
    final pincodeController = TextEditingController();
    final stateController = TextEditingController();
    final countryController = TextEditingController();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),

          child: Container(
            padding: const EdgeInsets.all(16),
            height: 620,
            child: Column(
              children: [

                Row(
                  children: [

                    const Expanded(
                      child: Text(
                        "Add Address",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),

                const SizedBox(height: 10),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [

                        buildField("Name", nameController),
                        buildField("House Name", houseController),
                        buildField("Flat No", flatController),
                        buildField("Landmark", landmarkController),
                        buildField("Place", placeController),
                        buildField("District", districtController),
                        buildField("Phone", phoneController,
                            keyboard: TextInputType.phone),
                        buildField("Pincode", pincodeController,
                            keyboard: TextInputType.number),


                        Container(
                          width: double.infinity,
                          height: 60,
                          child:   DropdownButton<String>(
                            hint: Text('Select a country'),
                            value: selectedCountry,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedCountry = newValue.toString();
                              });
                            },
                            items: countries.map<DropdownMenuItem<String>>((String country) {
                              return DropdownMenuItem<String>(
                                value: country,
                                child: Text(country),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            height: 60,
                            child:    DropdownButton<String>(
                              hint: Text('Choose a state'),
                              value: selectedState,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedState = newValue!;
                                });
                              },
                              items: states.map<DropdownMenuItem<String>>((String state) {
                                return DropdownMenuItem<String>(
                                    value: state,
                                    child:Container(width: 180,

                                      child:
                                      Text(state,style: TextStyle(fontSize: 14,color: Colors.black),maxLines: 2,overflow: TextOverflow.ellipsis,) ,
                                    )


                                );
                              }).toList(),
                            ) ),

                        const SizedBox(height: 15),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {

                              /// API CALL HERE
                              ///
                              ///


                              if(nameController.text.isNotEmpty)
                              {
                                if(houseController.text.isNotEmpty)
                                {
                                  if(landmarkController.text.isNotEmpty)
                                  {
                                    if(placeController.text.isNotEmpty)
                                    {
                                      if(districtController.text.isNotEmpty)
                                      {
                                        if(phoneController.text.isNotEmpty)
                                        {

                                          if(pincodeController.text.isNotEmpty)
                                          {


                                            Map<String,String>ap  =  {
                                              'name': nameController.text,
                                              'house': houseController.text,
                                              'flatno':flatController.text,
                                              'landmark': landmarkController.text,
                                              'place':placeController.text,
                                              'district':districtController.text,
                                              'state':selectedState,
                                              'phone':phoneController.text,
                                              'pincode':pincodeController.text,
                                              'userid':usr.id
                                            };
                                            // addNewAddress.php

                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              ApiHelper.showLoaderDialog(context);
                                            });

                                            ApiHelper apiHelper=new ApiHelper();

                                            String response=await apiHelper.postApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api_web/addAddress.php"+"?timestamp="+apiHelper.getRandomnumber(),ap);

                                            print(response);


                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                              Navigator.pop(context);
                                            });

                                            var js= jsonDecode(response) ;

                                            if(js['status']==1)
                                            {

                                            //  String addressidToChange=js['addressid'].toString();

                                             getAddressList();


                                             Navigator.pop(context);


                                            }






                                          }
                                          else{
                                            ApiHelper.showAlertDialog(context,  "Enter Pincode");
                                          }

                                        }
                                        else{
                                          ApiHelper.showAlertDialog(context,  "Enter Phone number");
                                        }


                                      }
                                      else{
                                        ApiHelper.showAlertDialog(context,  "Enter District");
                                      }


                                    }
                                    else{
                                      ApiHelper.showAlertDialog(context,  "Enter Place name");
                                    }


                                  }
                                  else{
                                    ApiHelper.showAlertDialog(context,  "Enter Landmark");
                                  }

                                }
                                else{
                                  ApiHelper.showAlertDialog(context,  "Enter House or Flat name");
                                }

                              }
                              else{
                                ApiHelper.showAlertDialog(context,  "Enter name");
                              }
                            },

                            child: const Text(
                              "Save Address",
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  /// reusable textfield
  Widget buildField(
      String hint,
      TextEditingController controller, {
        TextInputType keyboard = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
