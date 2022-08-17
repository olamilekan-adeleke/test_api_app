part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonEvent extends LoginEvent {
  const LoginButtonEvent({required this.email, required this.password});

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

// class SignUpEvent extends LoginEvent {
//   final SignUpDataModel signUpData;

//   const SignUpEvent(this.signUpData);

//   @override
//   List<Object> get props => [signUpData];
// }
