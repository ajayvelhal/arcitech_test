import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Create / Edit Post",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                fillColor: Colors.grey[400],
                filled: true,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                hintText: 'Title',
                hintStyle: const TextStyle(color: Colors.black),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                fillColor: Colors.grey[400],
                filled: true,
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                ),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                hintText: 'Description',
                hintStyle: const TextStyle(color: Colors.black),
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
          const SizedBox(height: 12.0),
          ElevatedButton(
            onPressed: () async {},
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Rectangular shape
              ),
              foregroundColor: Colors.black,
              backgroundColor: Colors.teal, // foreground
            ),
            child: const Text(
              "Create Task",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
