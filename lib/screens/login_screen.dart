import 'package:arcitech_new/bloc/login/login_bloc.dart';
import 'package:arcitech_new/bloc/login/login_state.dart';
import 'package:arcitech_new/screens/all_tasks_screen.dart';
import 'package:arcitech_new/screens/my_tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/login/login_event.dart';
import '../utils/validators.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        lazy: false,
        create: (context) => LoginBloc(),
        child: Scaffold(
            appBar: AppBar(title: const Text("Login")),
            body: BlocConsumer<LoginBloc, LoginState>(
              listener: (BuildContext context, state) {
                if (state is LoginError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter ${state.missingData}'),
                    ),
                  );
                } else if (state is LoginSuccess) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const MyTasksScreen()));
                }
              },
              builder: (BuildContext context, Object? state) {
                if (state is LoginLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            controller: nameController,
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
                              hintText: 'Name',
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            controller: emailController,
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
                              hintText: 'Email',
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.black,
                            controller: passwordController,
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
                              hintText: 'Password',
                              hintStyle: const TextStyle(color: Colors.black),
                            ),
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        ElevatedButton(
                          onPressed: () async {
                            BlocProvider.of<LoginBloc>(context).add(Login(
                                nameController.text,
                                emailController.text,
                                int.parse(passwordController.text)));
                            if (formKey.currentState?.validate() ?? false) {
                              ///Logins the user
                            } else {}
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.zero, // Rectangular shape
                            ),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.teal, // foreground
                          ),
                          child: const Text(
                            "SIGN UP",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            )));
  }
}
// extension EmailValidator on String {
//   bool isValidEmail() {
//     return RegExp(
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//         .hasMatch(this);
//   }
