import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recharge_retry/web/apiservices.dart';
import '../domain/eventmodel.dart';
import 'eventamount_list.dart';

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  late Future<List<EventModel>> futureEvents;

  @override
  void initState() {
    super.initState();
    futureEvents = fetchEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Events")),
      body: FutureBuilder<List<EventModel>>(
        future: futureEvents,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          final events = snapshot.data!;

          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final e = events[index];

              return GestureDetector(

                child: Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(e.name),
                    subtitle: Text("${e.date} | ${e.venue}"),
                    trailing: Text(e.place),
                  ),
                ) ,
                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventAmountScreen( eventId: e.id,)),
                  );
                },
              )



               ;
            },
          );
        },
      ),
    );
  }



  Future<List<EventModel>> fetchEvents() async {

    ApiHelper apiHelper=new ApiHelper();
    String t=apiHelper.getRandomnumber();

    final url = Uri.parse(
        "https://mysaving.in/IntegraAccount/ecommerce_api/getEventList.php?operation=get&q="+t
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List list = data['response'];

      return list.map((e) => EventModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load data");
    }
  }
}