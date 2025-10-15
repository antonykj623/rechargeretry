import 'package:flutter/material.dart';
import '../domain/cart_order_details_entity.dart';
import '../domain/cart_order_entity.dart';
import '../web/apiservices.dart';
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


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body:  Column(
          
          children: [
            
            Expanded(child: ListView.builder(
        itemCount: d.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              final item = d[index];
              return Card(
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
                  )));


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

              child: Column(
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
              ),



            )),flex: 2,)
            
            
          ],
        )
        
        
        
        
        // Card(
        //   margin: const EdgeInsets.all(16),
        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        //   elevation: 4,
        //   child: Padding(
        //     padding: const EdgeInsets.all(16),
        //     child: SingleChildScrollView(
        //
        //       child: Column(
        //         mainAxisSize: MainAxisSize.min,
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //
        //           Container(
        //             width: double.infinity,
        //             height: 130,
        //             child: Stack(
        //               children: [
        //
        //                 Align(
        //                   alignment: FractionalOffset.center,
        //
        //                   child:Image.network("https://mysaving.in/cart/"+d.primeImage.toString(),width: 110,
        //                     height: 110,fit: BoxFit.fill,
        //                     loadingBuilder: (context, child, loadingProgress) {
        //                       if (loadingProgress == null) return child; // Image loaded successfully
        //                       return Center(child: CircularProgressIndicator()); // Show loader while loading
        //                     },
        //                     errorBuilder: (context, error, stackTrace) {
        //                       return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
        //                     },
        //
        //                   ),
        //
        //
        //
        //
        //                 )
        //               ],
        //             ),
        //           )
        //
        //        ,
        //
        //
        //
        //           // Text('Order ID: ${d.orderId}', style: TextStyle(fontWeight: FontWeight.bold)),
        //           // Text('Product ID: ${d.productId}'),
        //           // Text('Product: ${d.productName}'),
        //           // Text('Product Code: ${d.productCode}'),
        //           // Text('Quantity: ${d.quantity}'),
        //           // (d.itemPointsRedeemed.toString().compareTo("0")==0)? Text('Order Price: ₹${d.mrp}') :Text('Order Price: ₹${d.priceSales}'),
        //           // Text('Created At: ${widget.orderdate}'),
        //           // SizedBox(height: 8),
        //           // Divider(),
        //           // SizedBox(height: 8),
        //           Text('Delivery Address:', style: TextStyle(fontWeight: FontWeight.bold)),
        //           SizedBox(height: 8),
        //           Text('${d.name}, ${d.housename}, Flat No: ${d.flatno}'),
        //           Text('Landmark: ${d.landmark}'),
        //           Text('${d.place}, ${d.district}, ${d.state}'),
        //           Text('Country: ${d.country}'),
        //           Text('Pincode: ${d.pincode}'),
        //           Text('Phone: ${d.phone}'),
        //           // SizedBox(height: 8),
        //           // Divider(),
        //           // SizedBox(height: 8),
        //
        //
        //         ],
        //       ),
        //     )
        //
        //
        //
        //   ),
        // ),

    );
  }
}
