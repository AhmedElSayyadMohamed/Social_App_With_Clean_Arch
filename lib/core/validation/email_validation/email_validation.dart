class EmailValidator {
  static String? checkEmailValidation(String? email) {
    if (email!.isEmpty) {
      return 'Please Enter your email';
    } else if (!validate(email)) {
      return 'email is\'t validate plz try to write valid email';
    }
    else {
      return null;
    }
  }

  static bool validate(String email) {
    // Regular expression for validating email addresses
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    // Check if the email matches the regular expression
    return emailRegex.hasMatch(email);
  }
}


