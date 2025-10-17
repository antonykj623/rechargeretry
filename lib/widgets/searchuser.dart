import 'dart:convert';

import 'package:flutter/material.dart';

import '../domain/ProfileEntity.dart';
import '../web/apiservices.dart';

class SearchListDialog extends StatefulWidget {
   SearchListDialog() ;

  @override
  _SearchListDialogState createState() => _SearchListDialogState();
}

class _SearchListDialogState extends State<SearchListDialog> {
  TextEditingController _searchController = TextEditingController();
  List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Grapes',
    'Mango',
    'Orange',
    'Pineapple',
    'Strawberry',
  ];
  List<String> filteredItems = [];

  List<UserData> usrdata=[];

  UserResponse? usr;

  @override
  void initState() {
    super.initState();
    filteredItems = items;


  }



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text("Select a new user to change"),
      content: Container(
        width: double.maxFinite,
        height: double.infinity,
        child: Column(
          children: [
            // 🔍 Search box
        Column(
          children: [
             TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search with reg ID or number",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            
        ElevatedButton(
              onPressed: () async {

                if(!_searchController.text.isEmpty)
                  {

                    //getUserDataBYRegid.php

                    String urldata="https://mysaving.in/IntegraAccount/ecommerce_api/getUserDataBYRegid.php?data="+_searchController.text;

                    ApiHelper apiHelper=new ApiHelper();

                    String response=await apiHelper.getApiResponse(urldata);

                    var js= jsonDecode(response) ;


                    final userResponse = UserResponse.fromJson(js);

                    setState(() {
                      usr=userResponse;
                      usrdata=usr!.data;
                    });


                  }




              },
              child: Text("Search"),
            ),

            
          ],
        )    ,
            
            
            
            SizedBox(height: 10),

            // 📋 List of filtered items
            Expanded(
              child: ListView.builder(
                itemCount: usrdata.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(usrdata[index].fullName+"\nMobile : "+usrdata[index].mobile+"\nReg ID :"+usrdata[index].regCode),
                    onTap: () {
                      Navigator.pop(context, usrdata[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Close"),
        ),
      ],
    );
  }
}
