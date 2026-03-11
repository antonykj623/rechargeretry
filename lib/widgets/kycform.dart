import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../domain/ProfileEntity.dart';
import '../domain/k_y_c_details_entity.dart';
import '../web/ApiMethodes.dart';
import '../web/apiservices.dart';

class KYCForm extends StatefulWidget {

  UserData usr;

  KYCForm(this.usr);

  @override
  _KYCFormState createState() => _KYCFormState(usr);
}

class _KYCFormState extends State<KYCForm> {

  UserData usr;

  _KYCFormState(this.usr);

  final picker = ImagePicker();

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

    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked == null) return;

    CroppedFile? cropped = await ImageCropper().cropImage(
      sourcePath: picked.path,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
        ),
        IOSUiSettings(
          title: 'Crop Image',
        ),
      ],
    );

    if (cropped != null) {

      setState(() {

        if (type == "aadhaar") {
          aadhaarImage = File(cropped.path);
        }

        if (type == "pan") {
          panImage = File(cropped.path);
        }

        if (type == "passbook") {
          passbookImage = File(cropped.path);
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

                    uploadRow("Upload Aadhaar Photo","aadhaar",aadhaarImage),

                    SizedBox(height: 20,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                            backgroundColor: Colors.blue
                        ),

                        onPressed: (){



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

                    uploadRow("Upload PAN Photo","pan",panImage),

                    SizedBox(height: 20,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                            backgroundColor: Colors.blue
                        ),

                        onPressed: (){



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

                    uploadRow("Upload Passbook Photo","passbook",passbookImage),
                    SizedBox(height: 20,),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(


                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(15),
                          backgroundColor: Colors.blue
                        ),

                        onPressed: (){



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
           adhaarimage=ApiMethodeCredentials.photoproof_baseurl+entity.data!.adharPhoto.toString();
          passbookimage=ApiMethodeCredentials.photoproof_baseurl+entity.data!.bankCheckleafPhoto.toString();
          panimage=ApiMethodeCredentials.photoproof_baseurl+entity.data!.panPhoto.toString();


        });
      }
    else
      {


      }





  }


}