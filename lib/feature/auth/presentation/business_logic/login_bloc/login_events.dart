abstract class LoginEvents{}

class LoginWithEmailAndPasswordEvent extends LoginEvents{
  final String email;
  final String password;

  LoginWithEmailAndPasswordEvent({
   required this.email,
   required this.password,
  });
}
class TogglePasswordSecurityEyeEvent extends LoginEvents{}