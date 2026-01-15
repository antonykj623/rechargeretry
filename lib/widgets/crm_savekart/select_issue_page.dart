import 'package:flutter/material.dart';
import 'IssueSelectiondialog.dart';
import 'complaint_form_page.dart';

class SelectIssuePage extends StatefulWidget {
  final String app;
  const SelectIssuePage({Key? key, required this.app}) : super(key: key);

  @override
  State<SelectIssuePage> createState() => _SelectIssuePageState();
}

class _SelectIssuePageState extends State<SelectIssuePage> {

  List<String>appquestions=[];
  final issues = [
    "Order Not Found",
    "Change User",
    "Change Product",
    "Payment Update",
    "Order Cancel",
    "Amount Refund",
    "Any Other",
  ];

  final issues_saveapp = [
    "Recharge issue",

    "Any Other",
  ];

  String? selectedIssue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if(widget.app.compareTo("SaveKart")==0)
      {
        appquestions=issues;
      }
    else{

      appquestions=issues_saveapp;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Issue")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ...appquestions.map((e) => RadioListTile(
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
                  : () async {

                if(selectedIssue.toString().compareTo("Recharge issue")==0)
                {

                  final result = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const IssueSelectionPage(),
                    ),
                  );

                  if (result != null) {
                    print("Selected Issue: $result");

                   selectedIssue=selectedIssue.toString()+": "+result.toString();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            ComplaintFormPage(
                              app: widget.app,
                              issue: selectedIssue!,
                            ),
                      ),
                    );

                  }


                }
                else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ComplaintFormPage(
                            app: widget.app,
                            issue: selectedIssue!,
                          ),
                    ),
                  );
                }
              },
              child: const Text("Next"),
            )
          ],
        ),
      ),
    );
  }
}
