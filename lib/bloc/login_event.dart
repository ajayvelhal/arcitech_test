
abstract class LoginEvent {}

class Login extends LoginEvent {
  final String name;
  final String email;
  final int password;

  Login(this.name, this.email, this.password);
}