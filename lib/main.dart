import 'package:flutter/material.dart';
import 'package:recharge_retry/dth_recharge/d_t_h_recharge_dashboard.dart';
import 'package:recharge_retry/dth_recharge/report/rechargereport.dart';
import 'package:recharge_retry/widgets/loginpage.dart';
import 'package:recharge_retry/widgets/native_prefs.dart';
import 'package:recharge_retry/widgets/recharge_list_screen.dart';
import 'package:recharge_retry/widgets/service_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Century gates services app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
   
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Century gates services app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectToRechargeList();
  }


  redirectToRechargeList()
  async {

    String? token=await NativePrefs.getValue("Token");



    Future.delayed(Duration(seconds: 3),() {
      if(token!=null)
      {
        if(!token.toString().isEmpty)
        {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SaveAppServicesScreen()),
          );
        }
        else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }

      }
      else{

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }

    },);


    // Future.delayed(Duration(seconds: 3),() {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => RechargeReportPage()),
    //   );
    //
    // },);

  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.asset("assets/icon.png",width: 100,height: 100,)




          ],
        ),
      ),
 // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
