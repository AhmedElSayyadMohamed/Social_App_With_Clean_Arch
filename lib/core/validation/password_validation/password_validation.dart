class PasswordValidation {
  static String? checkPasswordValidation(String? password) {
    if (password!.isEmpty) {
      return 'Please Enter your Password';
    } else {
      return null;
    }
  }
}
