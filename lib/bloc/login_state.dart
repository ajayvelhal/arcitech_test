abstract class LoginState{}


class LoginInitial extends LoginState{}

class LoginLoading extends LoginState{}

class LoginSuccess extends LoginState{
  final String name;

  LoginSuccess(this.name);
}

class LoginError extends LoginState{
  final String missingData;

  LoginError(this.missingData);

}