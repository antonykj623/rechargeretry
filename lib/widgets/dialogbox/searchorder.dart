import 'dart:convert';

import 'package:flutter/material.dart';



class SearchTextDialog extends StatefulWidget {
  const SearchTextDialog({Key? key}) : super(key: key);

  @override
  State<SearchTextDialog> createState() => _SearchTextDialogState();
}

class _SearchTextDialogState extends State<SearchTextDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Search Order"),
      content: TextField(
        controller: _controller,
        autofocus: true,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: "Enter Order ID",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
        ),
        onSubmitted: (value) {
          Navigator.pop(context, value.trim());
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, _controller.text.trim());
          },
          child: const Text("Search"),
        ),
      ],
    );
  }
}
