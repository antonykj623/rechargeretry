import 'package:flutter/material.dart';
import '../domain/cart_order_details_entity.dart';
import '../domain/cart_order_entity.dart';
 // Import your model here

class OrderDetailsPage extends StatefulWidget {
  final CartOrderDetailsData data;
  final String orderdate;
  final CartOrderData cartOrderData;

  const OrderDetailsPage({Key? key, required this.data,required this.orderdate,required this.cartOrderData}) : super(key: key);

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final d = widget.data;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(

              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    width: double.infinity,
                    height: 130,
                    child: Stack(
                      children: [

                        Align(
                          alignment: FractionalOffset.center,

                          child:Image.network("https://mysaving.in/cart/"+d.primeImage.toString(),width: 110,
                            height: 110,fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child; // Image loaded successfully
                              return Center(child: CircularProgressIndicator()); // Show loader while loading
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.image,size: 50,color: Colors.black26,); // Show a local placeholder on error
                            },

                          ),




                        )
                      ],
                    ),
                  )

               ,



                  Text('Order ID: ${d.orderId}', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Product ID: ${d.productId}'),
                  Text('Product: ${d.productName}'),
                  Text('Product Code: ${d.productCode}'),
                  Text('Quantity: ${d.quantity}'),
                  (d.itemPointsRedeemed.toString().compareTo("0")==0)? Text('Order Price: ₹${d.mrp}') :Text('Order Price: ₹${d.priceSales}'),
                  Text('Created At: ${widget.orderdate}'),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
                  Text('Delivery Address:', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('${d.name}, ${d.housename}, Flat No: ${d.flatno}'),
                  Text('Landmark: ${d.landmark}'),
                  Text('${d.place}, ${d.district}, ${d.state}'),
                  Text('Country: ${d.country}'),
                  Text('Pincode: ${d.pincode}'),
                  Text('Phone: ${d.phone}'),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),


                ],
              ),
            )



          ),
        ),
      ),
    );
  }
}
