part of 'login_cubit.dart';


abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}
class LoginSuccessState extends LoginState {
  LoginModel loginModel;
  LoginSuccessState({
    required this.loginModel,
  });
}
class LoginErrorState extends LoginState {
  final String? message;
   LoginErrorState({required this.message});
}

