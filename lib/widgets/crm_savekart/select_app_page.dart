import 'package:flutter/material.dart';
import 'select_issue_page.dart';
import 'IssueSelectiondialog.dart';

class SelectAppPage extends StatefulWidget {
  const SelectAppPage({Key? key}) : super(key: key);

  @override
  State<SelectAppPage> createState() => _SelectAppPageState();
}

class _SelectAppPageState extends State<SelectAppPage> {
  String? selectedApp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select mobile app",style: TextStyle(fontSize: 14),)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _radioTile("SaveKart"),
            _radioTile("Save App"),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: selectedApp == null
                  ? null
                  : () async {




                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SelectIssuePage(app: selectedApp!),
                    ),
                  );




              },
              child: const Text("Next"),
            )
          ],
        ),
      ),
    );
  }



  Widget _radioTile(String value) {
    return RadioListTile(
      title: Text(value),
      value: value,
      groupValue: selectedApp,
      onChanged: (val) {
        setState(() => selectedApp = val as String);
      },
    );
  }




}
