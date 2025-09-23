import 'package:flutter/material.dart';
import 'package:recharge_retry/dth_recharge/d_t_h_plans_screen.dart';

import 'Utils.dart';

class DTHRechargeDashboard extends StatefulWidget {
  const DTHRechargeDashboard() ;

  @override
  _DTHRechargeDashboardState createState() => _DTHRechargeDashboardState();
}

class _DTHRechargeDashboardState extends State<DTHRechargeDashboard> {

  final List<Plan> plans = [
    Plan(
      name: "Airtel Digital TV",
      serverName: "Airtel dth",
      opcode: "AD",
      spKey: "51",
      image: "assets/img.png",
    ),
    Plan(
      name: "Dish TV",
      serverName: "Dish TV",
      opcode: "DT",
      spKey: "53",
      image: "assets/img_1.png",
    ),
    Plan(
      name: "Sun Direct",
      serverName: "Sun Direct",
      opcode: "SD",
      spKey: "54",
      image: "assets/img_2.png",
    ),
    Plan(
      name: "Tata Sky",
      serverName: "Tata Sky",
      opcode: "TS",
      spKey: "55",
      image: "assets/img_3.png",
    ),
    Plan(
      name: "Videocon D2H",
      serverName: "Videocon",
      opcode: "VD",
      spKey: "56",
      image: "assets/img_4.png",
    ),
  ];

  String  spkey = "";
  String  Selected_operator_to_server = "";
  String Selected_operator = "", Selected_operator_code="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: GestureDetector(

          child: Icon(Icons.arrow_back,color: Colors.black,),

          onTap: (){

            Navigator.pop(context);

          },
        ),


        title: Text("DTH Recharge",style: TextStyle(fontSize: 14,color: Colors.white),),


      ),

      body: GridView.count(
        crossAxisCount: 3, // 3 columns
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        children: List.generate(plans.length, (index) {
          return GestureDetector(

            child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,

                  child:  Column(
                    children: [
                      Expanded(child: Image.asset(plans[index].image,fit: BoxFit.fill,),

                        flex: 2,
                      )
                      ,
                      Expanded(child: Text(plans[index].name),flex: 1,)




                    ],

                  ),
                  elevation: 4,
                )




            ) ,
            onTap: (){

              // spkey = plans[index].spKey;
              // Selected_operator_to_server = plans[index].serverName;
              // Selected_operator = plans[index].name;
              // Selected_operator_code=plans[index].opcode;

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DTHPlansScreen(plans[index])),
              );



            },
          )



            ;
        }),
      ),




    );
  }
}
