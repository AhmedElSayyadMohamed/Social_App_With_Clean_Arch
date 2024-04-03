part of 'register_bloc.dart';

abstract class RegisterStates {}

class RegisterInitial extends RegisterStates {}
class RegisterPasswordSecurityState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {}
class RegisterErrorState extends RegisterStates {
  final String msg;
  RegisterErrorState(this.msg);
}
class UploadNewUserDataToFireStoreLoadingState extends RegisterStates {}
class UploadNewUserDataToFireStoreSuccessState extends RegisterStates {}
class UploadNewUserDataToFireStoreErrorState extends RegisterStates {
  final String msg;
  UploadNewUserDataToFireStoreErrorState(this.msg);
}