import 'package:flutter/material.dart';

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
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: 7,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 0.0,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0), // Rounded corners
                side: const BorderSide(
                  color: Colors.grey, // Border color
                  width: 2.0, // Border width
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const ListTile(
                title: Text("Make Bed"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Do it before the office shift"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tom's Post"),
                        Text("Completed",style: TextStyle(color: Colors.greenAccent),),
                      ],
                    ),
                  ],
                ),

              ),
            );
            return Card(
              elevation: 3.0,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
    );
  }
}
