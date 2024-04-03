part of 'register_bloc.dart';

abstract class RegisterEvent {}
class RegisterNewUserEvent extends RegisterEvent{
  final String userName;
  final String email;
  final String phone;
  final String password;
  final String confirmPassword;

  RegisterNewUserEvent({
    required this.userName,
    required this.phone,
    required this.confirmPassword,
    required this.email,
    required this.password,
  });
}
class TogglePasswordSecurityEyeEvent extends RegisterEvent{}
