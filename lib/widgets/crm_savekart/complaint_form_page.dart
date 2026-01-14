import 'package:flutter/material.dart';
import 'complaint_source_page.dart';

class ComplaintFormPage extends StatefulWidget {
  final String app;
  final String issue;

  const ComplaintFormPage({
    Key? key,
    required this.app,
    required this.issue,
  }) : super(key: key);

  @override
  State<ComplaintFormPage> createState() => _ComplaintFormPageState();
}

class _ComplaintFormPageState extends State<ComplaintFormPage> {
  final orderController = TextEditingController();
  final reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complaint")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: orderController,
              decoration: const InputDecoration(
                labelText: "Order ID",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Issue",
                border: const OutlineInputBorder(),
                hintText: widget.issue,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: reasonController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Enter Reason",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ComplaintSourcePage(
                      orderId: orderController.text,
                      issue: widget.issue,
                      reason: reasonController.text,
                    ),
                  ),
                );
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
