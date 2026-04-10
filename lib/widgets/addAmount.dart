import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recharge_retry/web/apiservices.dart';

class AddEventAmountScreen extends StatefulWidget {
  final String eventId;

  AddEventAmountScreen({required this.eventId});

  @override
  _AddEventAmountScreenState createState() => _AddEventAmountScreenState();
}

class _AddEventAmountScreenState extends State<AddEventAmountScreen> {

  final TextEditingController amountController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  String pType = "0"; // 0 = Credit, 1 = Debit

  bool isLoading = false;

  /// 🔥 API CALL
  Future<void> submitData() async {
    setState(() => isLoading = true);

    ApiHelper apiHelper=new ApiHelper();
    String t=apiHelper.getRandomnumber();

    final url = Uri.parse(
        "https://mysaving.in/IntegraAccount/ecommerce_api/addEventAmount.php?q="+t);

    final response = await http.post(url, body: {
      "event_id": widget.eventId,
      "amount": amountController.text,
      "remarks": remarksController.text,
      "p_type": pType,
    });

    setState(() => isLoading = false);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Added Successfully")),
      );

      Navigator.pop(context); // go back
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Add Amount"),
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            /// 💰 Amount
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
              decoration: inputStyle("Enter Amount"),
            ),

            SizedBox(height: 15),

            /// 📝 Remarks
            TextField(
              controller: remarksController,
              style: TextStyle(color: Colors.white),
              decoration: inputStyle("Enter Remarks"),
            ),

            SizedBox(height: 20),

            /// 🔘 Payment Type
            Row(
              children: [
                Expanded(
                  child: radioBtn("Gpay", "0"),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: radioBtn("Cash", "1"),
                ),
              ],
            ),

            SizedBox(height: 30),

            /// 🚀 Submit Button
            GestureDetector(
              onTap: isLoading ? null : submitData,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrange],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                    "Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 🔹 Input Style
  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey),
      filled: true,
      fillColor: Colors.grey[900],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
    );
  }

  /// 🔹 Radio Button UI
  Widget radioBtn(String text, String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          pType = value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: pType == value ? Colors.orange : Colors.grey[900],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}