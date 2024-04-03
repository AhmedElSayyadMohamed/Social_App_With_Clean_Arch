class NameValidator {
  static String? checkNameValidation(String? username) {
    if (username!.isEmpty) {
      return 'Please Enter your name';
    } else if (username.toString().length < 8) {
      return 'name is\'t validate plz write minimum 8 char';
    }
  }
}
