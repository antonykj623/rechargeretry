import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import '../domain/cart_order_details_entity.dart';
import '../domain/cart_order_entity.dart';
import '../domain/useraddress.dart';
import '../web/apiservices.dart';
import 'package:intl/intl.dart';

import 'ordered_user.dart';
 // Import your model here

class OrderDetailsPage extends StatefulWidget {
  final 	List<CartOrderDetailsData>? data;
  final String orderdate;
  final CartOrderData cartOrderData;

  const OrderDetailsPage({Key? key, required this.data,required this.orderdate,required this.cartOrderData}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {



  String paymentstatus="0";

  String userid="0";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      userid=widget.cartOrderData.orderdata!.regId.toString();
    });
  }

  void _showSelectionDialog() async {
    // open the dialog and wait for selected value
    final result = await showDialog<String>(
      context: context,
      builder: (context) {
        // List of selectable items
        List<String> options = ["Paid", "Initiated", "Failed"];

        List<String> options1 = ["1", "2", "0"];

        return AlertDialog(
          title: const Text("Select an Payment status"),
          content: SizedBox(
            width: double.maxFinite,
            height: 250,
            child: ListView.builder(
              itemCount: options.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(options[index]),
                  onTap: () {
                    Navigator.pop(context, options1[index]); // return selected item
                  },
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // close without selection
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );

    // handle the selected value after dialog closes
    if (result != null) {
      setState(() {
        paymentstatus = result;
      });
//
//updatePaymentStatus.php

      ApiHelper.showLoaderDialog(context);


      ApiHelper apiHelper=new ApiHelper();

      String response=await apiHelper.getApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/updatePaymentStatus.php?timestamp="+apiHelper.getRandomnumber()+"&id="+widget.cartOrderData.orderdata!.id.toString()+"&status="+paymentstatus.toString());

      print(response);
      Navigator.pop(context);

      setState(() {
        widget.cartOrderData.orderdata!.paymentStatus=paymentstatus;
      });

      ApiHelper.showAlertDialog(context, "Payment status updated successfully");

    }
  }



  @override
  Widget build(BuildContext context) {
    List<CartOrderDetailsData> d = widget.data!;


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Order Details'),
        actions: [

          IconButton(icon: Icon(Icons.person,color: Colors.black,), onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UserDetailsPage(d[0],widget.cartOrderData),
              ),
            );


          },),

        ],

      ),
      body:  Column(
          
          children: [
            
            Expanded(child: ListView.builder(
        itemCount: d.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              final item = d[index];
              return GestureDetector(
                  onTap: (){


                    showStepperDialog(context, item);

                  },
               child: Card(
                margin: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: ListTile(
                  leading: Image.network("https://mysaving.in/cart/"+item.primeImage.toString(),width: 60,
                height: 60,fit: BoxFit.fill,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child; // Image loaded successfully
                  return Center(child: CircularProgressIndicator()); // Show loader while loading
                },
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
                },

              ),
                  title: Text(item.productName.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Quantity: ${item.quantity.toString()}"),
                      Text("Amount: ₹${item.price.toString()}"),
                      Text("Product Code: ₹${item.productCode}"),
                      Text("Order Date: ${widget.cartOrderData!.orderdata!.dateOrder}"),
                    ],
                  ))));


        })
                ,flex: 3,),

            Expanded(child: Card(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Text('Payment Status: ${widget.cartOrderData.orderdata!.paymentStatus.toString() == "1" ? "Paid" : (widget.cartOrderData.orderdata!.paymentStatus.toString() == "0" ? "Failed":"Pending") }',style: TextStyle(color: widget.cartOrderData.orderdata!.paymentStatus.toString() == "1" ? Colors.green : (widget.cartOrderData.orderdata!.paymentStatus.toString() == "0" ? Colors.red:Colors.amber
                  ),)),
                  SizedBox(height: 8),
                  
                 IconButton(onPressed: (){

                   _showSelectionDialog();

                 }, icon: Icon(Icons.edit))
                  
    
    


                ],
              ),



            ),flex: 1,),

            Expanded(child: Container(
    width: double.infinity,

    child:


            Card(

              child: Row(

    children: [

      Expanded(child:    Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Delivery Address:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('${d[0].name}, ${d[0].housename}, Flat No: ${d[0].flatno}'),
          Text('Landmark: ${d[0].landmark}'),
          Text('${d[0].place}, ${d[0].district}, ${d[0].state}'),
          Text('Country: ${d[0].country}'),
          Text('Pincode: ${d[0].pincode}'),
          Text('Phone: ${d[0].phone}'),

        ],
      ),flex: 3,),

      Expanded(child: Stack(
        children: [

          Align(
            alignment: FractionalOffset.center,

            child: IconButton(onPressed: (){

              showMenuDialog( context);



            }, icon: Icon(Icons.edit)),
          )
        ],
      ))
    ],
    )






            )),flex: 2,)
            
            
          ],
        )
        
        
        
        


    );
  }


  void showMenuDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Option'),
          children: [
            SimpleDialogOption(
              onPressed: () async {
                Navigator.pop(context);
                String addressid=  widget.data![0].addressid.toString();

                UserAddressDataData useraddressdata=new  UserAddressDataData();
                useraddressdata.name=widget.data![0].name;
                useraddressdata.id=addressid;
                useraddressdata.country=widget.data![0].country;
                useraddressdata.district=widget.data![0].district;
                useraddressdata.flatno=widget.data![0].flatno;
                useraddressdata.housename=widget.data![0].housename;
                useraddressdata.landmark=widget.data![0].landmark;
                useraddressdata.phone=widget.data![0].phone;
                useraddressdata.pincode=widget.data![0].pincode;
                useraddressdata.place=widget.data![0].place;
                useraddressdata.state=widget.data![0].state;
                useraddressdata.userId=widget.data![0].userId;


                final result = await showDialog<Map<String, String>>(
                  context: context,
                  builder: (context) => InputDialog(useraddressdata),
                );

                // Check if the result is not null
                if (result != null) {

               //   updateAddressForOffice.php


                  String name = result['name'] ?? '';
                  String house = result['house'] ?? '';
                  String flatno = result['flatno'] ?? '';
                  String landmark = result['landmark'] ?? '';
                  String district = result['district'] ?? '';
                  String place = result['place'] ?? '';
                  String phone = result['phone'] ?? '';
                  String pincode = result['pincode'] ?? '';
                  String state = result['state'] ?? '';
                  String userid=useraddressdata.userId.toString();
                  Map<String, String> mp = new HashMap();
                  mp['name'] = name;
                  mp['house'] = house;
                  mp['flatno'] = flatno;
                  mp['landmark'] = landmark;
                  mp['district'] = district;
                  mp['place'] = place;
                  mp['phone'] = phone;
                  mp['pincode'] = pincode;
                  mp['state'] = state;
                  mp['userid']=userid;
                  mp['id']=addressid;



                  ApiHelper apiHelper=new ApiHelper();

                  String response=await apiHelper.postApiResponse("https://mysaving.in/IntegraAccount/ecommerce_api/updateAddressForOffice.php?timestamp="+apiHelper.getRandomnumber(),mp);

                  print(response);


                  setState(() {

                 widget.data![0].name=name;

                    widget.data![0].country="India";
                  widget.data![0].district=district;
                   widget.data![0].flatno=flatno;
                    widget.data![0].housename=house;
                   widget.data![0].landmark=landmark;
               widget.data![0].phone=phone;
                   widget.data![0].pincode=pincode;
              widget.data![0].place=place;
                    widget.data![0].state=state;
                  widget.data![0].userId=userid;

                  });


                }










              },
              child: Row(
                children: [
                  Icon(Icons.edit, color: Colors.blue),
                  SizedBox(width: 10),
                  Text('Edit Address'),
                ],
              ),
            ),


          ],
        );
      },
    );
  }




  Widget create_appropriateStepper(CartOrderDetailsData crt)
  {

    int _statusValue=int.parse(crt.orderItemStatus!);
    Widget w=Container();

    if(widget.cartOrderData.orderdata!.paymentStatus?.compareTo("2")==0  )
    {
      w=Stepper(steps: [
        Step(
          title: Text("Order Initiated"),
          subtitle: Text("You have initiated to create an order\nDate : "+  ((crt.createdAt != null && crt.createdAt!.isNotEmpty)
              ? getFormatedDate(crt!.createdAt.toString())
              : " No date available")),
          content: SizedBox.shrink(),
          isActive: true,
        ),
        Step(
          title: Text("Payment Not Completed"),
          subtitle: Text("You have not completed your payment",style: TextStyle(color: Colors.redAccent),),
          content: SizedBox.shrink(),
          isActive: true,
        )
      ], controlsBuilder: (context,controller){
        return const SizedBox.shrink();
      });
    }
    else if(widget.cartOrderData.orderdata!.paymentStatus?.compareTo("0")==0  )
    {
      w=Stepper(steps: [
        Step(
          title: Text("Order Initiated"),
          subtitle: Text("You have initiated to create an order\nDate : "+  ((crt.createdAt != null && crt.createdAt!.isNotEmpty)
              ? getFormatedDate(crt.createdAt!)
              : " No date available")),
          content: SizedBox.shrink(),
          isActive: true,
        ),
        Step(
          title: Text("Payment Failed"),
          subtitle: Text("Your transaction failed",style: TextStyle(color: Colors.redAccent),),
          content: SizedBox.shrink(),
          isActive: true,
        )
      ], controlsBuilder: (context,controller){
        return const SizedBox.shrink();
      });
    }

    else {

      if(_statusValue ==0 || _statusValue==1 || _statusValue==2 || _statusValue==3)
      {
        w= Stepper(
          controlsBuilder: (context,controller){
            return const SizedBox.shrink();
          },
          currentStep: _statusValue,
          steps: [
            Step(
              title: Text("Order Created"),
              subtitle: Text(
                  "You have created an order. \nDate :" +
                      ((crt.createdAt != null && crt.createdAt!.isNotEmpty)
                          ? getFormatedDate(crt.createdAt!)
                          : " No date available")
              ),
              content: SizedBox.shrink(),
              isActive: _statusValue >= 0,
            ),

            Step(
              title: Text("Packing"),
              subtitle: Text("Order Packing is on progress.\nDate : "+((crt.packedAt != null && crt.packedAt!.isNotEmpty)
                  ? getFormatedDate(crt.packedAt!)
                  : " No date available")),
              content: SizedBox.shrink(),
              isActive: _statusValue >= 1,
            ),
            Step(
              title: Text("Shipped"),
              subtitle: Text("Shipped.You will get your product soon."+((crt.podNumber != null && crt.podNumber!.isNotEmpty) ? "\nTracking Number : "+crt.podNumber:"")+"\nDate : "+((crt.shippedAt != null && crt.shippedAt!.isNotEmpty)
                  ? getFormatedDate(crt.shippedAt!)
                  : " No date available")),
              content: SizedBox.shrink(),
              isActive: _statusValue >= 2,
            ),

            Step(
              title: Text("Delivered"),
              subtitle: Text("Order Delivered successfully.\nDate : "+((crt.deliveryRecvedDateFromAgency != null && crt.deliveryRecvedDateFromAgency!.isNotEmpty)
                  ? getFormatedDate(crt.deliveryRecvedDateFromAgency!)
                  : " No date available")),
              content: SizedBox.shrink(),
              isActive: _statusValue >= 3,
            ),


          ],
        );
      }
      else if(_statusValue==4){
        w= Stepper(
          controlsBuilder: (context,controller){
            return const SizedBox.shrink();
          },
          currentStep: _statusValue,
          steps: [
            Step(
              title: Text("Order Created"),
              subtitle: Text(
                  "You have created an order. \nDate :" +
                      ((crt.createdAt != null && crt.createdAt!.isNotEmpty)
                          ? getFormatedDate(crt.createdAt!)
                          : " No date available")
              ),
              content: SizedBox.shrink(),
              isActive: _statusValue >= 0,
            ),

            Step(
              title: Text("Packing"),
              subtitle: Text("Order Packing is on progress.\nDate : "+((crt.packedAt != null && crt.packedAt!.isNotEmpty)
                  ? getFormatedDate(crt.packedAt!)
                  : " No date available")),
              content: SizedBox.shrink(),
              isActive: _statusValue >= 1,
            ),
            Step(
              title: Text("Out for delivery"),
              subtitle: Text("Out for delivery.You will get your product soon.\nDate : "+((crt.shippedAt != null && crt.shippedAt!.isNotEmpty)
                  ? getFormatedDate(crt.shippedAt!)
                  : " No date available")),
              content: SizedBox.shrink(),
              isActive: _statusValue >= 2,
            ),

            Step(
              title: Text("Delivered"),
              subtitle: Text("Order Delivered successfully.\nDate : "+((crt.deliveryRecvedDateFromAgency != null && crt.deliveryRecvedDateFromAgency!.isNotEmpty)
                  ? getFormatedDate(crt.deliveryRecvedDateFromAgency!)
                  : " No date available")),
              content: SizedBox.shrink(),
              isActive: _statusValue >= 3,
            ),
            Step(
              title: Text("Returned"),
              subtitle: Text("Order returned successfully. Your return request accepted"


                ,style: TextStyle(color: Colors.redAccent),),
              content: SizedBox.shrink(),
              isActive: _statusValue == 4,
            ),


          ],
        );
      }
      else if(_statusValue==5){

        w=Stepper(steps: [
          Step(
            title: Text("Order Created"),
            subtitle: Text("You have created an order.\n Date : "+((crt.createdAt != null && crt.createdAt!.isNotEmpty)
                ? getFormatedDate(crt.createdAt!)
                : " No date available")),
            content: SizedBox.shrink(),
            isActive: _statusValue >= 0,
          ),
          Step(
            title: Text("Cancelled"),
            subtitle: Text("Order cancelled on  \n Date : "+((crt.cancelledAt != null && crt.cancelledAt!.isNotEmpty)
                ? getFormatedDate(crt.cancelledAt!)
                : " No date available")),
            content: SizedBox.shrink(),
            isActive: _statusValue >= 5,
          )
        ], controlsBuilder: (context,controller){
          return const SizedBox.shrink();
        });
      }
    }
    return w;
  }

  void showStepperDialog(BuildContext context, CartOrderDetailsData crt) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.8,
              minWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order Status',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const Divider(),

                // Scrollable Stepper area
                Expanded(
                  child: SingleChildScrollView(
                    child: create_appropriateStepper(crt),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }




  getFormatedDate(String dateString) {
    // String dateString = "2025-03-26 21:39:05"; // Input date string

    // Parse the string into DateTime
    DateTime dateTime = DateTime.parse(dateString);

    // Format DateTime into 12-hour format with AM/PM
    String formattedDate = DateFormat('dd-MMM-yyyy').format(dateTime);

    return formattedDate; // Output: 2025-03-26 09:39:05 PM
  }


}

class InputDialog extends StatefulWidget {

  UserAddressDataData userAddressDataData;
  InputDialog(this.userAddressDataData);


  @override
  _InputDialogState createState() => _InputDialogState(this.userAddressDataData);
}

class _InputDialogState extends State<InputDialog> {
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

  UserAddressDataData userAddressDataData;
  _InputDialogState(this.userAddressDataData);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      _nameController.text=userAddressDataData.name.toString();

      _phoneController.text=userAddressDataData.phone.toString();
      _houseflatnameController.text=userAddressDataData.housename.toString();
      _houseflatnoController.text=userAddressDataData.flatno.toString();
      _placenameController.text=userAddressDataData.place.toString();
      _landmarkController.text=userAddressDataData.landmark.toString();
      _districtController.text=userAddressDataData.district.toString();
      _pincodecontroller.text=userAddressDataData.pincode.toString();
      if(userAddressDataData.state.toString().isEmpty)
      {
        selectedState = "Kerala";
      }
      else {
        selectedState = userAddressDataData.state.toString();
      }


    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _houseflatnameController.dispose();
    _houseflatnoController.dispose();
    _placenameController.dispose();
    _landmarkController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
  // void _deleteAddress(){
  //   Navigator.of(context).pop({
  //     'delete': "1"
  //   });
  // }

  void _submitData() {
    final name = _nameController.text;
    // final address = _addressController.text;
    final phone = _phoneController.text;

    if(name.isNotEmpty)
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

                  Navigator.of(context).pop({
                    'name': name,
                    'house': _houseflatnameController.text,
                    'flatno':_houseflatnoController.text,
                    'landmark': _landmarkController.text,
                    'place':_placenameController.text,
                    'district':_districtController.text,
                    'state':selectedState,
                    'phone':_phoneController.text,
                    'pincode':_pincodecontroller.text
                  });
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

    // Close the dialog and pass the data back

  }



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter Address"),
      content: SingleChildScrollView(
        child: Column(
          children: [
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
            )


          ],
        ),
      ),
      actions: [

        // (userAddressDataData.id.toString().isNotEmpty)?  ElevatedButton(
        //   onPressed: _deleteAddress,
        //   child: Text("Delete"),
        // ) : Container(),
        ElevatedButton(
          onPressed: _submitData,
          child: Text("Submit"),
        ),
      ],
    );
  }



}
