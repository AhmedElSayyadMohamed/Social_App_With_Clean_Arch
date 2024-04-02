abstract class RegisterStates {}

class InitialState extends RegisterStates {}

class PasswordSecurityState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  String userid;
  RegisterSuccessState(this.userid);
}

class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error);
}

class CreateUserLoadingState extends RegisterStates {}

class CreateUserSuccessState extends RegisterStates {}

class CreateUserErrorState extends RegisterStates {}
