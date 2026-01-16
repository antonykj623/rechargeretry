import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recharge_retry/domain/autopool_count_entity.dart';
import 'package:recharge_retry/web/ApiMethodes.dart';
import 'package:recharge_retry/widgets/loginpage.dart';
import 'package:recharge_retry/widgets/recharge_list_screen.dart';
import 'package:recharge_retry/widgets/save_kart_orders.dart';
import 'package:recharge_retry/widgets/searchuser.dart';
import 'package:recharge_retry/widgets/wallet_balance.dart';
import 'package:recharge_retry/widgets/wallet_points.dart';

import 'package:url_launcher/url_launcher.dart';
import '../domain/ProfileEntity.dart';
import '../web/apiservices.dart';
import '../web/nativeurllauncher.dart';
import 'OrderDetails.dart';
import 'crm_savekart/complaint_list.dart';
import 'crm_savekart/select_app_page.dart';
import 'dialogbox/searchorder.dart';


class SaveAppServicesScreen extends StatefulWidget {
  const SaveAppServicesScreen({Key? key}) : super(key: key);

  @override
  State<SaveAppServicesScreen> createState() => _SaveAppServicesScreenState();
}

class _SaveAppServicesScreenState extends State<SaveAppServicesScreen> {




  List<String>saveappkarticons=["Recharge","Wallet","Purchase Points","Invisible orders","Order List","BBPS Report","Change Order's User","Add new Address","Create new order","Register Complaints"];

  List<IconData> saveappkartIconData = [
    Icons.phone_android,        // Recharge
    Icons.account_balance_wallet, // Wallet
    Icons.shopping_cart,        // Purchase Points
    Icons.visibility_off,       // Invisible orders
    Icons.list_alt,             // Order List
    Icons.receipt_long,         // BBPS Report
    Icons.swap_horiz,           // Change Order's User
    Icons.location_on,          // Add new Address
    Icons.add_box,
    Icons.report_gmailerrorred// Create new order
  ];


  List<String>saveappProcount=["Auto Pool Pro Count"];
  List<IconData> saveappProcountIcons = [
    Icons.auto_graph, // Auto Pool Count List
  ];


  List<String>weblinks=["Ambika multiservices","My saving","My Save app"];

  List<IconData> weblinksIcons = [
    Icons.public,        // Ambika multiservices
    Icons.savings,       // My saving
    Icons.language,      // My Save app
  ];


  List<String>adminpanels=["SaveKart Admin","My Save Admin"];

  List<IconData> adminpanelIcons = [
    Icons.admin_panel_settings, // SaveKart Admin
    Icons.manage_accounts,     // My Save Admin
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }


  @override
  void dispose() {

    super.dispose();
  }

  Future<bool?> showConfirmationDialog({
    required BuildContext context,
    String title = "Confirm",
    String message = "Are you sure?",
    String yesText = "Yes",
    String noText = "No",
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(noText),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(yesText),
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
        leading: Padding(padding: EdgeInsets.only(left: 16),
        child:  Image.asset("assets/newicon.jpg",width: 40,height: 40,),

        ),



        title: const Text("SAVE APP Settings",style: TextStyle(fontSize: 15),),
        centerTitle: true,

        actions: [

          Padding(padding: EdgeInsets.all(5),

            child: TextButton(onPressed: () async {



              bool? confirmed = await showConfirmationDialog(
                context: context,
                title: "Logout",
                message: "Do you really want to logout ?",
                yesText: "Yes",
                noText: "No",
              );

              if (confirmed == true) {
                // Perform delete action
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder:
                        (context) =>
                        LoginPage()
                    )
                );
              }


            }, child: Text("Logout",style: TextStyle(fontSize: 16),)),

          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔹 Animation Video Section
           Container(
             width: double.infinity,
             height: MediaQuery.of(context).size.width/1.777,
             child: Image.asset("assets/sc.png",fit: BoxFit.fill,),


           ),

            const SizedBox(height: 24),

            /// 🔹 saveApp / save kart
            const Text(
              "SaveApp / Savekart",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: saveappkarticons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(

                  child: serviceItemModified(
                    icon: saveappkartIconData[index],
                    title: saveappkarticons[index],
                  ) ,
                  onTap: () async {
//["Recharge","Wallet","Purchase Points","Invisible orders",
// "Order List","BBPS Report","Change Order's User",
// "Add new Address","Create new order"];

                    if(index==0)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RechargeListScreen()),
                        );
                      }
                    else if(index==1)
                      {

                        final selectedItem = await showDialog(
                          context: context,
                          builder: (context) => SearchListDialog(),
                        );

                        if (selectedItem != null) {

                          UserData usr=selectedItem as UserData;


                          //wallet balance

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => WalletBalance(usr),
                            ),
                          );



                        }
                      }

                    else if(index==2)
                    {

                      final selectedItem = await showDialog(
                        context: context,
                        builder: (context) => SearchListDialog(),
                      );

                      if (selectedItem != null) {

                        UserData usr=selectedItem as UserData;

                        //wallet balance

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => WalletPoints(usr),
                          ),
                        );










                      }
                    }
                    else if(index==3)
                      {
//invisible order

                      final result = await showDialog<String>(
                        context: context,
                        builder: (context) => SearchTextDialog(),
                      );

                      if (result != null) {
                        print("User entered: $result");

//getOrderDetailsByIDStaff.php

                        ApiHelper.showLoaderDialog(context);

                      String ur=ApiMethodeCredentials.ecommerce_baseurl+ApiMethodeCredentials.getOrderDetailsByIDStaff+"?timestamp="+new ApiHelper().getRandomnumber()+"&orderid="+result;

                      ApiHelper apihelper=new ApiHelper();
                      String js=await apihelper.getApiResponse(ur);

                      Navigator.pop(context);

                      var jsdata=jsonDecode(js);


                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => OrderDetailsScreen(data: jsdata['data']),
                          ),
                        );








                      }




                    }
                    else if(index==4)
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SaveKartOrders()),
                        );
                      }
                    else if(index==5)
                      {

                      }
                    else if(index==6)
                      {

                      }
                    else if (index==7)
                      {

                      }
                    else if(index==8)
                      {


                      }
                    else if(index==9)
                      {



                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ComplaintListPage()),
                        );


                      }

                  },
                )



                 ;
              },
            ),

            const SizedBox(height: 24),

            /// 🔹 Save App pro trading
            const Text(
              "Save App Pro Tracker",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: saveappProcount.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return

                GestureDetector(

                  child: serviceItemModified(
                    icon: saveappProcountIcons[index],
                    title: saveappProcount[index],
                  ),
                  onTap: () async {

                    final selectedItem = await showDialog(
                      context: context,
                      builder: (context) => SearchListDialog(),
                    );

                    if (selectedItem != null) {

                      UserData usr=selectedItem as UserData;


                      showAvailableCount(usr);



                    }

                  },
                )


                  ;
              },
            ),

            const SizedBox(height: 24),

            /// 🔹 Save App pro trading
            const Text(
              "Web Links",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: weblinks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {

                //  List<String>weblinks=["Ambika multiservices","My saving","My Save app"];



                return GestureDetector(

                  child:   serviceItemModified(
                    icon: weblinksIcons[index],
                    title: weblinks[index],
                  ),
                  onTap: (){

                    if(index==0)
                      {
                        openUrl("https://ambikamultiservices.com/Login");
                      }

                    else if(index==1)
                      {
                        openUrl("https://mysaving.in/");
                      }

                    else if(index==2)
                      {
                        openUrl("https://mysaveapp.com/");
                      }


                  },
                )




                ;
              },
            ),
            const SizedBox(height: 24),
            const Text(
              "Admin Panel Links",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: adminpanels.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(

                  child: serviceItemModified(
                    icon: adminpanelIcons[index],
                    title: adminpanels[index],
                  ),
                  onTap: () async {
                  //  List<String>adminpanels=["SaveKart Admin","My Save Admin"];

                    if(index==0)
                      {
//https://mysaving.in/web/savecartadmin



                      openUrl("https://mysaving.in/web/savecartadmin");
                      // Change URL based on platform


                      }
                    else if(index==1) {
//https://mysaving.in/index.php/web/loguser


                      openUrl("https://mysaving.in/index.php/web/loguser");

                      // Change URL based on platform

                    }

                  },
                );





              },
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Grid Item Widget
  Widget serviceItem() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Icon(
          Icons.apps,
          size: 32,
        ),
      ),
    );
  }

  Widget serviceItemModified({required IconData icon, required String title}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      // decoration: BoxDecoration(
      //   border: Border.all(color: Colors.grey.shade400),
      //   borderRadius: BorderRadius.circular(8),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Color(0xff17706e),
            size: 32,

          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.black
            ),
          ),
        ],
      ),
    );
  }


  Future<void> openUrl(String url) async {
    NativeUrlLauncher.openUrl(
    url
    );
  }


  showAvailableCount(UserData usr)
  async {

    ApiHelper.showLoaderDialog(context);
    String a=DateTime.now().microsecondsSinceEpoch.toString();
    String urldata=ApiMethodeCredentials.saveapp_baseurl+ApiMethodeCredentials.getAutoPoolCount+"?timestamp="+a+"&userid="+usr.id;

    ApiHelper apiHelper=new ApiHelper();

    String response=await apiHelper.getApiResponse(urldata);
    Navigator.pop(context);

    var js= jsonDecode(response) ;

    AutopoolCountEntity autopoolCountEntity=AutopoolCountEntity.fromJson(js);

    if(autopoolCountEntity.status==1)
      {
        showIdCountDialog(context, js);
      }
    else{
      ApiHelper.showAlertDialog(context, "No data found");
    }

  }
  void showIdCountDialog(BuildContext context, Map<String, dynamic> data) {
    final info = data['data'];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Row(
            children: [
              const Expanded(
                child: Text(
                  "ID Count Details",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.blue),
                onPressed: () {
                  Navigator.pop(context);
                  showEditDialog(context, info);
                },
              )
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // infoRow("Registration ID", info['reg_id']),
              infoRow("Total Count", info['total_id_count']),
              infoRow("Used Count", info['used_count']),
              infoRow("Available Count", info['avilable_count']),
              infoRow("Updated At", info['updated_at']),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CLOSE"),
            )
          ],
        );
      },
    );
  }


  void showEditDialog(BuildContext context, Map<String, dynamic> info) {
    final totalController =
    TextEditingController(text: info['total_id_count']);
    final usedController =
    TextEditingController(text: info['used_count']);

    final availableController =
    TextEditingController(text: info['avilable_count']);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title:  Text("Edit Pro Counts",style: TextStyle(fontSize: 14),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: totalController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Total Count",
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: usedController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Used Count",
                ),
              ),

              const SizedBox(height: 10),
              TextField(
                controller: availableController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Available Count",
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL"),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                // 🔥 call API here if needed
                print("Updated Total: ${totalController.text}");
                print("Updated Used: ${usedController.text}");

                String totalcount="0",usedcount="0",availablecount="0";

                if(totalController.text.trim().isNotEmpty)
                  {
                    totalcount=totalController.text.trim();
                  }

                if(usedController.text.trim().isNotEmpty)
                {
                  usedcount=usedController.text.trim();
                }

                if(availableController.text.trim().isNotEmpty)
                {
                  availablecount=availableController.text.trim();
                }

              //  updateAutopoolCount.php



updateProCount(usedcount, availablecount, totalcount, info['reg_id']);


              },
              child: const Text("SAVE"),
            )
          ],
        );
      },
    );
  }


  updateProCount(String usedcount,String availablecount,String totalcount,String regid) async {
    ApiHelper.showLoaderDialog(context);

    Map<String,String>mp=new HashMap();
    mp["used"]=usedcount;
    mp["available"]=availablecount;
    mp["total"]=totalcount;
    mp["reg_id"]=regid;

    String a=DateTime.now().microsecondsSinceEpoch.toString();
    String urldata=ApiMethodeCredentials.saveapp_baseurl+ApiMethodeCredentials.updateAutopoolCount+"?timestamp="+a;

    ApiHelper apiHelper=new ApiHelper();

    String response=await apiHelper.postApiResponse(urldata,mp);
    Navigator.pop(context);

    var js= jsonDecode(response) ;

    if(js['status']==1)
    {
      ApiHelper.showAlertDialog(context, "Updated successfully");
    }
    else{

      ApiHelper.showAlertDialog(context, "Updation failed");
    }

  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }


}

