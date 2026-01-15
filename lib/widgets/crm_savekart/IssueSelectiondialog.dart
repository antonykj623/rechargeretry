import 'package:flutter/material.dart';

class IssueSelectionPage extends StatefulWidget {
  const IssueSelectionPage({Key? key}) : super(key: key);

  @override
  State<IssueSelectionPage> createState() => _IssueSelectionPageState();
}

class _IssueSelectionPageState extends State<IssueSelectionPage> {
  String selectedIssue = "";

  final List<String> issues = [
    "Operator change",
    "User change",
    "Payment status",
    "GEN status",
    "Mobile number change",
    "Any other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Issue"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: issues.map((issue) {
                return RadioListTile<String>(
                  title: Text(issue),
                  value: issue,
                  groupValue: selectedIssue,
                  onChanged: (value) {
                    setState(() {
                      selectedIssue = value!;
                    });
                  },
                );
              }).toList(),
            ),
          ),

          /// 🔹 Submit Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: selectedIssue.isEmpty
                    ? null
                    : () {
                  Navigator.pop(context, selectedIssue);
                },
                child: const Text("Submit"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
