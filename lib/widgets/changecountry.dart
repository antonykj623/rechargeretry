import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/domain/country_list_entity.dart';

import '../domain/ProfileEntity.dart';
import '../web/ApiMethodes.dart';
import '../web/apiservices.dart';

class CountryStateForm extends StatefulWidget {

  UserData usr;

  CountryStateForm(this.usr);


  @override
  _CountryStateFormState createState() => _CountryStateFormState(this.usr);
}

class _CountryStateFormState extends State<CountryStateForm> {



  UserData usr;

  _CountryStateFormState(this.usr);

  CountryListData? selectedCountry;
  CountryListDataData? selectedState;

  List<CountryListData>? data = [];

  List<CountryListDataData> states = [];

  String state_id="0",country_id="0";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCountryWithState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Coutry and state",style: TextStyle(fontSize: 14),),

        actions: [


          Padding(padding: EdgeInsets.all(5),

          child:   ElevatedButton(
            onPressed: () async {
              if(selectedCountry != null && selectedState != null){
                print("Country: $selectedCountry");
                print("State: $selectedState");

//updateStateCountry.php

                // $userid=$_POST['user_id'];
                // $state_id=$_POST['state_id'];
                // $country_id=$_POST['country_id'];

                String userid=usr.id.toString();
                String stateid=selectedState!.id.toString();
                String countryid=selectedCountry!.countryId.toString();

                ApiHelper.showLoaderDialog(context);

                Map<String,String>mp=new HashMap();
                mp["user_id"]=userid;
                mp["state_id"]=stateid;
                mp["country_id"]=countryid;


                String a=DateTime.now().microsecondsSinceEpoch.toString();
                String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.updateStateCountry+"?timestamp="+a;

                ApiHelper apiHelper=new ApiHelper();

                String response=await apiHelper.postApiResponse(urldata,mp);
                Navigator.pop(context);
                Map mp_response=jsonDecode(response);

                if(mp_response['status']==1)
                  {


                    ApiHelper.showAlertDialog(context, "Country updation success");
                  }
                else{

                  ApiHelper.showAlertDialog(context, "Country updation failed");
                }







              }
              else{

                ApiHelper.showAlertDialog(context, "select country and state");
              }
            },
            child: Text("Submit"),
          )
            ,


          )

        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [

            /// Country Dropdown
            DropdownButtonFormField<CountryListData>(
              hint: Text("Select Country"),
              value: selectedCountry,
              items: data!.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country.countryName.toString()),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCountry = value ;
                  country_id=selectedCountry!.countryId.toString();
                  states = selectedCountry!.data! ;
                  selectedState = null;
                });
              },
            ),

            SizedBox(height: 20),

            /// State Dropdown
            (states.length > 0)
                ? Expanded(
              child: DropdownButtonFormField<CountryListDataData>(
                isExpanded: true,
                hint: Text("Select State"),
                value: selectedState,
                items: states.map((state) {
                  return DropdownMenuItem(
                    value: state,
                    child: Text(state.stateName.toString()),
                  );


                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedState = value;
                    state_id=selectedState!.id.toString();
                  });
                },
              ),
            )
                : Container(),
            SizedBox(height: 30),

            /// Submit Button

          ],
        ),
      ),
    );
  }




  getCountryWithState()async
  {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();
    String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.getCountryWithState+"?q="+apiHelper.getRandomnumber();

    String data1=await apiHelper.getApiResponse(urldata);

    WidgetsBinding.instance.addPostFrameCallback((_) {

      Navigator.pop(context);
    });


    CountryListEntity entity=CountryListEntity.fromJson(jsonDecode(data1));

    if(entity.status==1)
      {

setState(() {
  data!.clear();
  data!.addAll(entity.data!);

});

      }




  }



}