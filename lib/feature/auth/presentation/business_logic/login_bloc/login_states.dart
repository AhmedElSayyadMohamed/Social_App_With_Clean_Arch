import 'package:social_app/feature/auth/domain/entities/user.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginPasswordSecurityState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final UserEntity user;

  LoginSuccessState(this.user);
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}
