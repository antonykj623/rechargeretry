import 'package:flutter/material.dart';
import 'complaint_form_page.dart';

class SelectIssuePage extends StatefulWidget {
  final String app;
  const SelectIssuePage({Key? key, required this.app}) : super(key: key);

  @override
  State<SelectIssuePage> createState() => _SelectIssuePageState();
}

class _SelectIssuePageState extends State<SelectIssuePage> {
  final issues = [
    "Order Not Found",
    "Change User",
    "Change Product",
    "Payment Update",
    "Order Cancel",
    "Amount Refund",
    "Any Other",
  ];

  String? selectedIssue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Issue")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...issues.map((e) => RadioListTile(
              title: Text(e),
              value: e,
              groupValue: selectedIssue,
              onChanged: (val) {
                setState(() => selectedIssue = val as String);
              },
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedIssue == null
                  ? null
                  : () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ComplaintFormPage(
                      app: widget.app,
                      issue: selectedIssue!,
                    ),
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
}
