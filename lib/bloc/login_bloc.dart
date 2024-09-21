

import 'package:arcitech_new/bloc/login_event.dart';
import 'package:arcitech_new/bloc/login_event.dart';
import 'package:arcitech_new/bloc/login_state.dart';
import 'package:arcitech_new/models/auth_response.dart';
import 'package:arcitech_new/respository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AuthRepository _authRepository = AuthRepository();
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is Login) {
        if (event.name.isEmpty) {
          emit(LoginError("Name"));
        }
        else if(event.email.isEmpty){
          emit(LoginError("Email Id"));
        }
        // else if(event.password.toString().isEmpty){
        //   emit(LoginError("Password"));
        // }
        else {
          emit(LoginLoading());
          Map<String,dynamic> requestBody  = {
            "name":event.name,
            "email":event.email,
            "password":event.password
          };
          AuthResponse response = await _authRepository.signUpAndLogin(requestBody);
          if(response.status==200){
            emit(LoginSuccess(event.name));
          }
          else{
            emit(LoginError(response.message ?? ''));
          }
        }
      }
    });
  }
}