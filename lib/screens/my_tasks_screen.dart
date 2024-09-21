import 'package:arcitech_new/screens/add_task_screen.dart';
import 'package:flutter/material.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Tasks",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        actions: [
          const Text(
            "Log Out",
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 12.0,
          ),
          const Icon(
            Icons.menu,
            color: Colors.white,
          )
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0.0,
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0), // Rounded corners
                    side: BorderSide(
                      color: Colors.grey, // Border color
                      width: 2.0, // Border width
                    ),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                    title: Text(index.toString()),
                    subtitle: Text(index.toString()),
                  ),
                );
                return Card(
                  elevation: 3.0,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    trailing: const InkWell(
                        // onTap: () {
                        //   homeScreenController.addProductsToFavorite(product);
                        // },
                        child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
                    leading: const Center(),
                    title: Text(index.toString()),
                    subtitle: Text(index.toString()),
                  ),
                );
              }),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddTaskScreen()));
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
  }
}
