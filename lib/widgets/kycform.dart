import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import '../domain/ProfileEntity.dart';
import '../domain/k_y_c_details_entity.dart';
import '../web/ApiMethodes.dart';
import '../web/apiservices.dart';
import 'package:http/http.dart' as http;

import '../web/nativegallery.dart';



class KYCForm extends StatefulWidget {

  UserData usr;

  KYCForm(this.usr);

  @override
  _KYCFormState createState() => _KYCFormState(usr);
}

class _KYCFormState extends State<KYCForm> {

  UserData usr;

  _KYCFormState(this.usr);



  TextEditingController aadhaarController = TextEditingController();
  TextEditingController panController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController holderController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController ifscController = TextEditingController();

  File? aadhaarImage;
  File? panImage;
  File? passbookImage;

  String adhaarimage="",panimage="",passbookimage="";

  Future pickAndCropImage(String type) async {


      String? imagePath = await NativeCrop.pickAndCrop();

      if (imagePath != null) {

        setState(() {
          if (type == "aadhaar") {
            aadhaarImage = File(imagePath);
          }

          if (type == "pan") {
            panImage = File(imagePath);
          }

          if (type == "passbook") {
            passbookImage = File(imagePath);
          }
        });
      }

  }

  Widget preview(File? file){

    if(file == null){
      return Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey)
        ),
        child: Icon(Icons.image),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: Image.file(file,height:70,width:70,fit:BoxFit.cover),
    );
  }

  Widget uploadRow(String title,String type,File? file){

    return Row(
      children: [

        Expanded(child: Text(title)),

        IconButton(
          icon: Icon(Icons.upload,color: Colors.blue),
          onPressed: ()=>pickAndCropImage(type),
        ),

        preview(file)

      ],
    );

  }

  Widget sectionTitle(String text){

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),
      ),
    );

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getKYCDetails();
  }


  Future confirmDialog(BuildContext context,String message) async {

    return await showDialog(
      context: context,
      builder: (context) {

        return AlertDialog(
          title: Text("Confirm"),
          content: Text(message),
          actions: [

            TextButton(
              onPressed: () {
                Navigator.pop(context,false);
              },
              child: Text("Cancel"),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context,true);
              },
              child: Text("Confirm"),
            ),

          ],
        );

      },
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("KYC Verification"),
      ),

      body: SingleChildScrollView(

        padding: EdgeInsets.all(16),

        child: Column(

          children: [

            /// Aadhaar Section
            Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [

                    sectionTitle("Aadhaar Details"),

                    TextFormField(
                      controller: aadhaarController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Aadhaar Number",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height:15),

                    (adhaarimage.isNotEmpty)? Stack(
                      children: [

                        /// Network Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                           adhaarimage,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error,size: 100,);
                            },
                          ),
                        ),

                        /// Close Button
                        Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () {

                              setState(() {

                                adhaarimage="";
                              });



                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        )

                      ],
                    )    :   uploadRow("Upload Aadhaar Photo","aadhaar",aadhaarImage),

                    SizedBox(height: 20,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                            backgroundColor: Colors.blue
                        ),

                        onPressed: () async {


                          bool confirm = await confirmDialog(context,"Submit KYC details?");

                          if(confirm) {
                            print("Proceed API");


                            ApiHelper.showLoaderDialog(context);
                            ApiHelper apihelper = new ApiHelper();


                            var uri = Uri.parse(
                                ApiMethodeCredentials.ecommerce_baseurl +
                                    ApiMethodeCredentials.uploadAdharDetails +
                                    "?q=" + apihelper.getRandomnumber());

                            var request = http.MultipartRequest('POST', uri);

                            /// Text field
                            request.fields['aadhaar_number'] =
                                aadhaarController.text;
                            request.fields['user_id'] = usr.id;

                            if(adhaarimage.isNotEmpty) {
                              request.fields['image_exists'] = "1";
                            }
                            else{
                              request.fields['image_exists'] = "0";

                            }

                            /// Image file
                            ///
                            ///
                            ///
                            if (aadhaarImage != null) {
                              request.files.add(
                                await http.MultipartFile.fromPath(
                                  'aadhaar_image',
                                  aadhaarImage!.path,
                                ),
                              );
                            }

                            var response = await request.send();
                            Navigator.pop(context);
                            getKYCDetails();

                            if (response.statusCode == 200) {



                            } else {
                              print("Upload failed");
                            }
                          }

                        },

                        child: Text("Submit"),

                      ),
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(height:20),

            /// PAN Section
            Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [

                    sectionTitle("PAN Card Details"),

                    TextFormField(
                      controller: panController,
                      decoration: InputDecoration(
                        labelText: "PAN Number",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height:15),

                    (panimage.isNotEmpty)? Stack(
                      children: [

                        /// Network Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            panimage,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error,size: 100,);
                            },
                          ),
                        ),

                        /// Close Button
                        Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () {

                              setState(() {

                                panimage="";
                              });



                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        )

                      ],
                    )    :   uploadRow("Upload PAN Photo","pan",panImage),

                    SizedBox(height: 20,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                            backgroundColor: Colors.blue
                        ),

                        onPressed: () async {

                          bool confirm = await confirmDialog(context,"Submit KYC details?");

                          if(confirm) {
                            print("Proceed API");


                            ApiHelper.showLoaderDialog(context);
                            ApiHelper apihelper = new ApiHelper();


                            var uri = Uri.parse(
                                ApiMethodeCredentials.ecommerce_baseurl +
                                    ApiMethodeCredentials.uploadPanDetails +
                                    "?q=" + apihelper.getRandomnumber());

                            var request = http.MultipartRequest('POST', uri);

                            /// Text field
                            request.fields['pan_number'] =
                                panController.text;
                            request.fields['user_id'] = usr.id;

                            if(panimage.isNotEmpty) {
                              request.fields['image_exists'] = "1";
                            }
                            else{
                              request.fields['image_exists'] = "0";

                            }

                            /// Image file
                            ///
                            ///
                            ///
                            if (panImage != null) {
                              request.files.add(
                                await http.MultipartFile.fromPath(
                                  'pan_image',
                                  panImage!.path,
                                ),
                              );
                            }

                            var response = await request.send();
                            Navigator.pop(context);
                            getKYCDetails();
                            if (response.statusCode == 200) {



                            } else {
                              print("Upload failed");
                            }
                          }

                        },

                        child: Text("Submit"),

                      ),
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(height:20),

            /// Bank Section
            Card(
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [

                    sectionTitle("Bank Account Details"),

                    TextFormField(
                      controller: accountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Account Number",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height:10),

                    TextFormField(
                      controller: holderController,
                      decoration: InputDecoration(
                        labelText: "Account Holder Name",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height:10),

                    TextFormField(
                      controller: bankController,
                      decoration: InputDecoration(
                        labelText: "Bank Name",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height:10),

                    TextFormField(
                      controller: branchController,
                      decoration: InputDecoration(
                        labelText: "Branch Name",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height:10),

                    TextFormField(
                      controller: ifscController,
                      decoration: InputDecoration(
                        labelText: "IFSC Code",
                        border: OutlineInputBorder(),
                      ),
                    ),

                    SizedBox(height:15),

                    (passbookimage.isNotEmpty)? Stack(
                      children: [

                        /// Network Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            passbookimage,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error,size: 100,);
                            },
                          ),
                        ),

                        /// Close Button
                        Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () {

                              setState(() {

                                passbookimage="";
                              });



                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(5),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        )

                      ],
                    )    :   uploadRow("Upload Passbook Photo","passbook",passbookImage),
                    SizedBox(height: 20,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(


                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          backgroundColor: Colors.blue
                        ),

                        onPressed: () async {

                          bool confirm = await confirmDialog(context,"Submit KYC details?");

                          if(confirm) {
                            print("Proceed API");


                            ApiHelper.showLoaderDialog(context);
                            ApiHelper apihelper = new ApiHelper();


                            var uri = Uri.parse(
                                ApiMethodeCredentials.ecommerce_baseurl +
                                    ApiMethodeCredentials.uploadAccountDetails +
                                    "?q=" + apihelper.getRandomnumber());

                            var request = http.MultipartRequest('POST', uri);

                            /// Text field
                            request.fields['account_no'] =
                                accountController.text;
                            request.fields['holder']=holderController.text;
                            request.fields['branch'] =
                                branchController.text;
                            request.fields['bank_name']=bankController.text;
                            request.fields['ifsc']=ifscController.text;
                            request.fields['user_id'] = usr.id;



                            if(passbookimage.isNotEmpty) {
                              request.fields['image_exists'] = "1";
                            }
                            else{
                              request.fields['image_exists'] = "0";

                            }

                            /// Image file
                            ///
                            ///
                            ///
                            if (passbookImage != null) {
                              request.files.add(
                                await http.MultipartFile.fromPath(
                                'passbook_image',
                                passbookImage!.path,
                              ),
                          );
                          }

                          var response = await request.send();
                          Navigator.pop(context);
                          getKYCDetails();
                          if (response.statusCode == 200) {



                          } else {
                          print("Upload failed");
                          }
                        }








                        },

                        child: Text("Submit"),

                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height:30),

            /// Final Submit Button


            SizedBox(height:20)

          ],

        ),

      ),

    );

  }


  getKYCDetails() async {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ApiHelper.showLoaderDialog(context);
    });

    ApiHelper apiHelper=new ApiHelper();
    String urldata=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.getKYCDetails+"?q="+apiHelper.getRandomnumber()+"&user_id="+usr.id;

    String data1=await apiHelper.getApiResponse(urldata);

    WidgetsBinding.instance.addPostFrameCallback((_) {

      Navigator.pop(context);
    });

    KYCDetailsEntity entity=KYCDetailsEntity.fromJson(jsonDecode(data1));

    if(entity.status==1)
      {
        setState(() {


          aadhaarController .text=entity.data!.adharNo.toString();
           panController.text=entity.data!.panNo.toString();
        accountController.text=entity.data!.bankAccountNo.toString();
          holderController.text=entity.data!.bankAccountName.toString();
           bankController.text=entity.data!.bankName.toString();
           branchController.text=entity.data!.branchName.toString();
           ifscController.text=entity.data!.ifsc.toString();
           if(entity.data!.adharPhoto.toString().isNotEmpty) {
             adhaarimage = ApiMethodeCredentials.photoproof_baseurl +
                 entity.data!.adharPhoto.toString();
           }
          if(entity.data!.bankCheckleafPhoto.toString().isNotEmpty) {
            passbookimage = ApiMethodeCredentials.photoproof_baseurl +
                entity.data!.bankCheckleafPhoto.toString();
          }

          if(entity.data!.panPhoto.toString().isNotEmpty) {
            panimage = ApiMethodeCredentials.photoproof_baseurl +
                entity.data!.panPhoto.toString();
          }
        });
      }
    else
      {


      }





  }


}