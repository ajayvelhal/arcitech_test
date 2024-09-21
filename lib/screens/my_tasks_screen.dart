import 'package:arcitech_new/bloc/task/task_bloc.dart';
import 'package:arcitech_new/bloc/task/task_event.dart';
import 'package:arcitech_new/models/task_response.dart';
import 'package:arcitech_new/screens/add_task_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task/task_state.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc()..add(FetchTask(TaskResponse())),
      child: BlocConsumer<TaskBloc, TaskState>(
        listener: (BuildContext context, TaskState state) {
          if (state is TaskCreationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (BuildContext context, TaskState state) {
          if (state is TaskLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TasksFetchedSuccessfully) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "My Tasks",
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.teal,
                actions: const [
                  Text(
                    "Log Out",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  )
                ],
              ),
              body: Stack(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.response.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 0.0,
                          borderOnForeground: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0),
                            // Rounded corners
                            side: const BorderSide(
                              color: Colors.grey, // Border color
                              width: 2.0, // Border width
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: ListTile(
                            trailing: const SizedBox(
                              width: 200.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 12.0,
                                  ),
                                  Icon(
                                    Icons.mode_edit_outline_outlined,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                            ),
                            title:
                                Text(state.response.data?[index].title ?? ""),
                            subtitle: Text(
                                state.response.data?[index].description ?? ""),
                          ),
                        );
                      }),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddTaskScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero, // Rectangular shape
                        ),
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.teal, // foreground
                      ),
                      child: const Text(
                        "Add Task",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center();
          }
        },
      ),
    );
  }
}
