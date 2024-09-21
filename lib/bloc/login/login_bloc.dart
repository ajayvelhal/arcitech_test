import 'package:arcitech_new/bloc/login/login_event.dart';
import 'package:arcitech_new/bloc/login/login_state.dart';
import 'package:arcitech_new/models/auth_response.dart';
import 'package:arcitech_new/respository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository = AuthRepository();
  SharedPreferences? sharedPreferences;
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      sharedPreferences = await SharedPreferences.getInstance();
      if (event is Login) {
        if (event.name.isEmpty) {
          emit(LoginError("Name"));
        } else if (event.email.isEmpty) {
          emit(LoginError("Email Id"));
        } else {
          emit(LoginLoading());
          Map<String, dynamic> requestBody = {
            "name": event.name,
            "email": event.email,
            "password": event.password
          };
          AuthResponse response =
              await _authRepository.signUpAndLogin(requestBody);
          if (response.status == 200) {
            sharedPreferences?.setString("auth_token", response.access ?? "");
            emit(LoginSuccess(event.name));
          } else {
            emit(LoginError(response.message ?? ''));
          }
        }
      }
    });
  }
}
