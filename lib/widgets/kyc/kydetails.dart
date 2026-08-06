import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class KycDetailsPage extends StatefulWidget {
  final Map<String, dynamic> item;

  const KycDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  State<KycDetailsPage> createState() => _KycDetailsPageState();
}

class _KycDetailsPageState extends State<KycDetailsPage> {

  static const String imageBaseUrl =
      "https://mysaving.in/uploads/proof/";

  late Map<String, dynamic> browserInfo;

  late Map<String, dynamic> approvebrowserInfo;

  String address = "Loading...";

  String approveaddress = "Loading...";

  @override
  void initState() {
    super.initState();

    if (widget.item["kyc_update_browser_info"] != null &&
        widget.item["kyc_update_browser_info"].toString().isNotEmpty) {
      browserInfo =
          jsonDecode(widget.item["kyc_update_browser_info"]);
      getAddress();
    } else {
      browserInfo = {};
    }


    if (widget.item["kyc_approve_browser_info"] != null &&
        widget.item["kyc_approve_browser_info"].toString().isNotEmpty) {
      approvebrowserInfo =
          jsonDecode(widget.item["kyc_approve_browser_info"]);
      getApproveLocation();
    } else {
      approvebrowserInfo = {};
    }


  }

  Widget buildImage(String title, String? fileName) {
    if (fileName == null || fileName.isEmpty) {
      return const SizedBox();
    }

    return Card(
      margin: const EdgeInsets.only(top: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageBaseUrl + fileName,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;

                  return const SizedBox(
                    height: 250,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
                errorBuilder: (_, __, ___) {
                  return const SizedBox(
                    height: 250,
                    child: Center(
                      child: Icon(Icons.broken_image,size: 80),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget info(String title, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(
            width: 140,
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: Text(value?.toString() ?? ""),
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final item = widget.item;

    return Scaffold(

      appBar: AppBar(
        title: const Text("KYC Details"),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(12),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.start,

                  children: [

                    info("Name", item["full_name"]),
                    info("Reg Code", item["reg_code"]),
                    info("Mobile", item["mobile"]),
                    info("Email", item["email_id"]),
                    info("Aadhaar", item["adhar_no"]),
                    info("PAN", item["pan_no"]),
                    info("Bank", item["bank_name"]),
                    info("Account", item["bank_account_no"]),
                    info("IFSC", item["ifsc"]),
                    info("Branch", item["branch_name"]),
                    info("Updated", item["kyc_update_date"]),

                  ],
                ),
              ),
            ),

            buildImage(
              "PAN Card",
              item["pan_photo"],
            ),

            buildImage(
              "Aadhaar Card",
              item["adhar_photo"],
            ),

            buildImage(
              "Bank Passbook",
              item["bank_checkleaf_photo"],
            ),

            const SizedBox(height: 20),

            const Text(
              "KYC Update Browser Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(

                  children: browserInfo.entries
                      .map(
                        (e) => info(
                      e.key,
                      e.value,
                    ),
                  )
                      .toList(),
                ),
              ),
            ),

            const Text(
              "KYC Update Location Address",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(address,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
              ),
            ),




            const Text(
              "KYC Approve Browser Information",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(

                  children: approvebrowserInfo.entries
                      .map(
                        (e) => info(
                      e.key,
                      e.value,
                    ),
                  )
                      .toList(),
                ),
              ),
            ),

            const Text(
              "KYC Approve Location info",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(approveaddress,style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> getAddress() async {
  //   try {
  //     double latitude =
  //     double.parse(browserInfo["latitude"].toString());
  //
  //     double longitude =
  //     double.parse(browserInfo["longitude"].toString());
  //
  //     if (latitude == -1 || longitude == -1) {
  //       setState(() {
  //         address = "Location not available";
  //       });
  //       return;
  //     }
  //
  //     List<Placemark> placemarks =
  //     await placemarkFromCoordinates(latitude, longitude);
  //
  //     Placemark place = placemarks.first;
  //
  //     setState(() {
  //       address =
  //       "${place.name}, ${place.street}, ${place.locality}, "
  //           "${place.subAdministrativeArea}, "
  //           "${place.administrativeArea}, "
  //           "${place.country} - ${place.postalCode}";
  //     });
  //   } catch (e) {
  //     setState(() {
  //       address = "Unable to get address";
  //     });
  //   }
  // }

  Future<void> getAddress() async {
    try {
      double latitude =
          double.tryParse(browserInfo["latitude"].toString()) ?? -1;

      double longitude =
          double.tryParse(browserInfo["longitude"].toString()) ?? -1;

      if (latitude == -1 || longitude == -1) {
        setState(() {
          address = "Location not available";
        });
        return;
      }

      final response = await http.get(
        Uri.parse(
            "https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude&format=jsonv2"),
        headers: {
          "User-Agent": "FlutterApp/1.0",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          address = data["display_name"] ?? "Address not found";
        });
      } else {
        setState(() {
          address = "Unable to fetch address";
        });
      }
    } catch (e) {
      setState(() {
        address = "Unable to get address";
      });
    }
  }



  Future<void> getApproveLocation() async {
    try {
      double latitude =
          double.tryParse(approvebrowserInfo["latitude"].toString()) ?? -1;

      double longitude =
          double.tryParse(approvebrowserInfo["longitude"].toString()) ?? -1;

      if (latitude == -1 || longitude == -1) {
        setState(() {
          approveaddress = "Location not available";
        });
        return;
      }

      final response = await http.get(
        Uri.parse(
            "https://nominatim.openstreetmap.org/reverse?lat=$latitude&lon=$longitude&format=jsonv2"),
        headers: {
          "User-Agent": "FlutterApp/1.0",
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        setState(() {
          approveaddress = data["display_name"] ?? "Address not found";
        });
      } else {
        setState(() {
          approveaddress = "Unable to fetch address";
        });
      }
    } catch (e) {
      setState(() {
        approveaddress = "Unable to get address";
      });
    }
  }

}