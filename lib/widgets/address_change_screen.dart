import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/domain/addressbyId.dart';
import 'package:recharge_retry/domain/cart_order_entity.dart';

import '../domain/cart_order_details_entity.dart';
import '../web/apiservices.dart';

class AddressChangeScreen extends StatefulWidget {

  String userid;
  String useridtoChage;
  String orderid;
  String addressid;
  CartOrderData cartOrderData;
  CartOrderDetailsData data;


   AddressChangeScreen(this.userid,this.useridtoChage,this.orderid,this.addressid,this.cartOrderData,this.data) ;

  @override
  _AddressChangeScreenState createState() => _AddressChangeScreenState(this.userid,this.useridtoChage,this.orderid,this.addressid,this.cartOrderData,this.data) ;
}

class _AddressChangeScreenState extends State<AddressChangeScreen> {

  String userid;
  String useridtoChage;
  String orderid;
  String addressid;
   CartOrderData cartOrderData;
  CartOrderDetailsData data;

  final _nameController = TextEditingController();
  final _houseflatnameController = TextEditingController();
  final _houseflatnoController = TextEditingController();
  final _placenameController = TextEditingController();
  final _landmarkController = TextEditingController();
  final _districtController = TextEditingController();

  final _phoneController = TextEditingController();
  final _pincodecontroller=TextEditingController();

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


  _AddressChangeScreenState(this.userid,this.useridtoChage,this.orderid,this.addressid,this.cartOrderData,this.data) ;


  String address="";

  UserData? usrd;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAddress();
  }

  getAddress()async
  {

    //getAddressByidoffice.php

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();

    String response=await apiHelper.getApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/getAddressByidoffice.php?timestamp="+apiHelper.getRandomnumber()+"&id="+widget.cartOrderData!.orderdata!.addressId.toString());

    print(response);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });

    var js= jsonDecode(response) ;

    ApiResponse apiResponse=ApiResponse.fromJson(js);

    if(apiResponse.status==1)
      {

        setState(() {
          usrd=apiResponse.data!;

          address=usrd!.name+"\n"
              +usrd!.housename+"\n"
              +usrd!.phone+"\n"
              +usrd!.pincode+"\n"
              +usrd!.place+"\n"
              +usrd!.district+"\n"
              +usrd!.state;



        });
      }




  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Change  Address'),

        actions: [
          Padding(padding: EdgeInsets.all(10),

          child:   ElevatedButton(
            onPressed: () async {

              if(_nameController.text.isNotEmpty)
              {
                if(_houseflatnameController.text.isNotEmpty)
                {
                  if(_landmarkController.text.isNotEmpty)
                  {
                    if(_placenameController.text.isNotEmpty)
                    {
                      if(_districtController.text.isNotEmpty)
                      {
                        if(_phoneController.text.isNotEmpty)
                        {

                          if(_pincodecontroller.text.isNotEmpty)
                          {

                     Map<String,String>ap  =  {
                              'name': _nameController.text,
                              'house': _houseflatnameController.text,
                              'flatno':_houseflatnoController.text,
                              'landmark': _landmarkController.text,
                              'place':_placenameController.text,
                              'district':_districtController.text,
                              'state':selectedState,
                              'phone':_phoneController.text,
                              'pincode':_pincodecontroller.text,
                       'userid':useridtoChage
                            };
                    // addNewAddress.php

                     WidgetsBinding.instance.addPostFrameCallback((_) {
                       ApiHelper.showLoaderDialog(context);
                     });

                     ApiHelper apiHelper=new ApiHelper();

                     String response=await apiHelper.postApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/addNewAddress.php?timestamp="+apiHelper.getRandomnumber(),ap);

                     print(response);


                     WidgetsBinding.instance.addPostFrameCallback((_) {
                       Navigator.pop(context);
                     });

                     var js= jsonDecode(response) ;

                     if(js['status']==1)
                       {

                         String addressidToChange=js['addressid'].toString();

                         updateUserAndAddressID(useridtoChage, addressidToChange,orderid);





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
            child: Text("Submit"),
          )


          )
        ],
      ),

      body: Column(

        children: [

          Expanded(child:

          Card(
            child: Row(
              children: [
                Expanded(child: Padding(

          padding: EdgeInsets.all(10),
          child:  Text("Current Address: \n\n"
              +address),
      )



               ,flex: 3,),

                Expanded(child: Stack(
                  children: [

                    Align(
                      alignment: FractionalOffset.center,
                      child: TextButton(onPressed: (){
                        setState(() {

                          _nameController.text=data.name.toString();

                          _phoneController.text=data.phone.toString();
                          _houseflatnameController.text=data.housename.toString();
                          _houseflatnoController.text=data.flatno.toString();
                          _placenameController.text=data.place.toString();
                          _landmarkController.text=data.landmark.toString();
                          _districtController.text=data.district.toString();
                          _pincodecontroller.text=data.pincode.toString();
                          if(data.state.toString().isEmpty)
                          {
                            selectedState = "Kerala";
                          }
                          else {
                            selectedState = data.state.toString();
                          }


                        });





                      }, child: Text("Copy")) ,
                    )



                  ],
                ),flex: 1,)



              ],
            ),

          ),flex: 1,),

          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [

                Padding(padding: EdgeInsets.all(10),

                child: TextButton(onPressed: (){
                  setState(() {

                    _nameController.clear();

                    _phoneController.clear();
                    _houseflatnameController.clear();
                    _houseflatnoController.clear();
                    _placenameController.clear();
                    _landmarkController.clear();
                    _districtController.clear();
                    _pincodecontroller.clear();
                    if(data.state.toString().isEmpty)
                    {
                      selectedState = "Kerala";
                    }



                  });





                }, child: Text("Clear All"))


                )


                ,
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                TextField(
                  controller: _houseflatnameController,
                  decoration: InputDecoration(labelText: "House / Flat name"),
                ),
                TextField(
                  controller: _houseflatnoController,
                  decoration: InputDecoration(labelText: "Flat no. (optional)"),
                ),
                TextField(
                  controller: _landmarkController,
                  decoration: InputDecoration(labelText: "Landmark"),
                ),

                TextField(
                  controller: _placenameController,
                  decoration: InputDecoration(labelText: "Place"),
                ),

                TextField(
                  controller: _districtController,
                  decoration: InputDecoration(labelText: "District"),
                ),

                TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: "Phone Number"),
                  keyboardType: TextInputType.phone,
                ),

                TextField(
                  controller: _pincodecontroller,
                  decoration: InputDecoration(labelText: "Pin Code"),
                  keyboardType: TextInputType.number,
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





              ],
            ),
          ),flex: 4,)

        ],
      ),

    );
  }


  updateUserAndAddressID(String useridtochange,String addressidtochange,String orderid)
  async {

    //updateUserAndAddressIdOrder.php

    Map<String,String>ap  =  {
      'userid': useridtochange,
      'addressid': addressidtochange,
      'orderid': orderid

    };


    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();

    String response=await apiHelper.postApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/updateUserAndAddressIdOrder.php?timestamp="+apiHelper.getRandomnumber(),ap);

    print(response);


    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Data saved successfully!'),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
    });
  }


}
