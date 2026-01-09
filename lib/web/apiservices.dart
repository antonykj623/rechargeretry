import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String baseurl = "https://mysaving.in/IntegraAccount/api/";



class ApiHelper {

  String getRandomnumber()
  {
    String a=DateTime.now().microsecondsSinceEpoch.toString();

    return a;
  }
  static showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  Future<String> getApiResponse(String url) async {



    Map<String, String> headers = {

      "Content-Type": "application/json",
      'Authorization':"qwertyuioplkjhgfvbnmlkjiou.OTc0NzQ5Nzk2Nw==.MjVkNTVhZDI4M2FhNDAwYWY0NjRjNzZkNzEzYzA3YWQ=.qwertyuioplkjhgfvbnmlkjiou"

    };



    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );


    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
        'Failed to load data: ${response.statusCode} - ${response.body}',
      );
    }
  }


  Future<String> postApiResponse(String url, Map <String,String> postData) async {

    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization':"qwertyuioplkjhgfvbnmlkjiou.OTc0NzQ5Nzk2Nw==.MjVkNTVhZDI4M2FhNDAwYWY0NjRjNzZkNzEzYzA3YWQ=.qwertyuioplkjhgfvbnmlkjiou"


      },
      body: postData,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
        'Failed to post data: ${response.statusCode} - ${response.body}',
      );
    }
  }


  static showAlertDialog(BuildContext context,String message)async{
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Save App Settings'),
          content: Text(message),
          actions: [

            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                // Add your action here
              },
            ),
          ],
        );
      },
    );

  }
}