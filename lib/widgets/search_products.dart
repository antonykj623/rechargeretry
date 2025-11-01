import 'package:flutter/material.dart';

import '../domain/ProfileEntity.dart';

class SearchProducts extends StatefulWidget {

  UserData usr;

   SearchProducts(this.usr) ;

  @override
  _SearchProductsState createState() => _SearchProductsState();
}

class _SearchProductsState extends State<SearchProducts> {



  TextEditingController searchController=new TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Search Products'),
        actions: [

          IconButton(icon: Icon(Icons.check,color: Colors.black,), onPressed: () {




          },),

        ],

      ),

      body: Column(

        children: [

          TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: "Search Products",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged:(txt){
             // filterProducts(txt.toString());
            },
          ),
          SizedBox(height: 16),


        ],
      )



    );
  }
}
