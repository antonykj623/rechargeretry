import 'package:flutter/material.dart';


class NameListDialog extends StatefulWidget {
  final List<String> names;

  const NameListDialog({Key? key, required this.names}) : super(key: key);

  @override
  State<NameListDialog> createState() => _NameListDialogState();
}

class _NameListDialogState extends State<NameListDialog> {
  String selectedName = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Text("Select Name"),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.names.length,
          itemBuilder: (context, index) {
            final name = widget.names[index];
            return RadioListTile<String>(
              title: Text(name),
              value: name,
              groupValue: selectedName,
              onChanged: (value) {
                setState(() {
                  selectedName = value!;
                });
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: selectedName.isEmpty
              ? null
              : () {
            Navigator.pop(context, selectedName);
          },
          child: const Text("Submit"),
        ),
      ],
    );
  }
}
