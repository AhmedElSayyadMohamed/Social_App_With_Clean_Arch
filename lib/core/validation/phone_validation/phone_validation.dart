class PhoneValidator {
  static String? checkPhoneValidation(String? phoneNumber) {
    if (phoneNumber!.isEmpty) {
      return 'Please Enter your phoneNumber';
    } else if (!validate(phoneNumber)) {
      return 'phoneNumber is\'t validate plz try to write valid phoneNumber';
    }
  }

  static bool validate(String phoneNumber) {
    if (phoneNumber.toString().length == 11) {
      return true;
    } else {
      return false;
    }
  }
}
