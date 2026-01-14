import 'package:flutter/material.dart';

class ComplaintSourcePage extends StatefulWidget {
  final String orderId;
  final String issue;
  final String reason;

  const ComplaintSourcePage({
    Key? key,
    required this.orderId,
    required this.issue,
    required this.reason,
  }) : super(key: key);

  @override
  State<ComplaintSourcePage> createState() => _ComplaintSourcePageState();
}

class _ComplaintSourcePageState extends State<ComplaintSourcePage> {
  String? source;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complaint Source")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _radio("WhatsApp Call"),
            _radio("WhatsApp Message"),
            _radio("Call"),
            _radio("Other"),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: source == null
                  ? null
                  : () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Complaint Submitted")),
                );
                Navigator.popUntil(context, (r) => r.isFirst);
              },
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }

  Widget _radio(String val) {
    return RadioListTile(
      title: Text(val),
      value: val,
      groupValue: source,
      onChanged: (v) => setState(() => source = v as String),
    );
  }
}
