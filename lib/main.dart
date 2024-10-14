import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FadeInList(),
    );
  }
}

class FadeInList extends StatefulWidget {
  @override
  _FadeInListState createState() => _FadeInListState();
}

class _FadeInListState extends State<FadeInList> {
  final List<String> items = List.generate(50, (index) => 'Item $index');
  final List<bool> _isVisible = List.generate(50, (index) => index<15);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Screen')),
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification.context?.mounted ?? false) {
            for (int i = 0; i < items.length; i++) {
              if (_isVisible[i] == false && scrollNotification.metrics.pixels > (i * 50) - 100) {
                setState(() {
                  _isVisible[i] = true;
                });
              }
            }
          }
          return true;
        },
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return FadeInItem(
              isVisible: _isVisible[index],
              child: ListTile(
                title: Text(items[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FadeInItem extends StatelessWidget {
  final bool isVisible;
  final Widget child;

  const FadeInItem({Key? key, required this.isVisible, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      child: child,
    );
  }
}


// import 'package:arcitech_new/bloc/login/login_bloc.dart';
// import 'package:arcitech_new/screens/add_task_screen.dart';
// import 'package:arcitech_new/screens/all_tasks_screen.dart';
// import 'package:arcitech_new/screens/login_screen.dart';
// import 'package:arcitech_new/screens/my_tasks_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:LoginScreen()
//     );
//   }
// }
