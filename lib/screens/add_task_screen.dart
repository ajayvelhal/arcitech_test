import 'dart:math';

import 'package:arcitech_new/bloc/task/task_bloc.dart';
import 'package:arcitech_new/bloc/task/task_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task/task_state.dart';

class AddTaskScreen extends StatelessWidget {
  final String? title, description;
  final bool? isCompleted;
  final int? taskId;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  AddTaskScreen(
      {super.key,
      this.title,
      this.description,
      this.isCompleted,
      this.taskId}) {
    titleController.text = title ?? "";
    descController.text = description ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(
            "Create / Edit Post",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<TaskBloc, TaskState>(
          listener: (BuildContext context, state) {
            if (state is TaskCreationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Please enter ${state.errorMessage}'),
                ),
              );
            } else {
              Navigator.pop(context);
            }
          },
          builder: (BuildContext context, state) {
            if (state is TaskLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      textInputAction: TextInputAction.search,
                      controller: titleController,
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
                      controller: descController,
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
                    onPressed: () async {
                      if (taskId == 0) {
                        BlocProvider.of<TaskBloc>(context).add(CreateTask(
                            titleController.text,
                            descController.text,
                            Random().nextBool()));
                      } else {
                        BlocProvider.of<TaskBloc>(context).add(EditTask(
                            taskId!,
                            titleController.text,
                            descController.text,
                            Random().nextBool()));
                      }
                    },
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
              );
            }
          },
        ),
      ),
    );
  }
}
