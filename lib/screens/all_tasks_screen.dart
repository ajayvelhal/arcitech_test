import 'package:arcitech_new/bloc/task/task_bloc.dart';
import 'package:arcitech_new/bloc/task/task_event.dart';
import 'package:arcitech_new/models/task_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/task/task_state.dart';

class AllTasksScreen extends StatelessWidget {
  const AllTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Tasks",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
        automaticallyImplyLeading: true,
        leading: InkWell(
          onTap: ()=> Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocProvider(
          create: (context) =>
              TaskBloc()..add(FetchOtherUsersTask(TaskResponse())),
          child: BlocConsumer<TaskBloc, TaskState>(
            listener: (BuildContext context, TaskState state) {
              if (state is TaskCreationError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (BuildContext context, TaskState state) {
              if (state is TaskLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is AllTasksFetchedSuccessfully) {
                return RefreshIndicator(
                  onRefresh: () {
                    BlocProvider.of<TaskBloc>(context).add(FetchOtherUsersTask(TaskResponse()));
                    return Future.value(false);
                  },
                  child: ListView.builder(
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
                            title: Text(state.response.data?[index].title ?? ""),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(state.response.data?[index].description ??
                                    ""),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(state.response.data?[index].user?.name
                                            .toString() ??
                                        ""),
                                    Text(
                                      state.response.data?[index].completed ??
                                              false
                                          ? "Completed"
                                          : "Incomplete",
                                      style: TextStyle(
                                          color: state.response.data?[index]
                                                      .completed ??
                                                  false
                                              ? Colors.greenAccent
                                              : Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                );
              } else {
                return const Center();
              }
            },
          )),
    );
  }
}
