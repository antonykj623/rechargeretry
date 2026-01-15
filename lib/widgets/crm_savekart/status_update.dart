import 'package:flutter/material.dart';

class StatusUpdateDialog extends StatefulWidget {
  @override
  State<StatusUpdateDialog> createState() => _StatusUpdateDialogState();
}

class _StatusUpdateDialogState extends State<StatusUpdateDialog> {
  String selectedStatus = "processing";
  final TextEditingController remarksController = TextEditingController();

  final List<String> statuses = [
    "processing",
    "initiated",
    "Completed",
  ];

  @override
  void dispose() {
    remarksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Update Status"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Status Dropdown
          const Text(
            "Status",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: selectedStatus,
            items: statuses
                .map(
                  (status) => DropdownMenuItem(
                value: status,
                child: Text(status),
              ),
            )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedStatus = value!;
              });
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),

          const SizedBox(height: 14),

          /// 🔹 Remarks
          const Text(
            "Remarks",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: remarksController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: "Enter remarks",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),

      /// 🔹 Actions
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, null),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, {
              "status": selectedStatus,
              "remarks": remarksController.text.trim(),
            });
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
