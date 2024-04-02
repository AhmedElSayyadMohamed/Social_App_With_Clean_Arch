
import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/strings_manager/strings_manager.dart';

class FirebaseAuthExceptionHandler {

  static String handleException(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return StringsManager.msgUserNotFound;
      case 'wrong-password':
        return StringsManager.msgPasswordInCorrect;
    // You can handle more error codes as needed.
      default:
        return '${StringsManager.defaultErrorMsg}: ${e.message}';
    }
  }
}