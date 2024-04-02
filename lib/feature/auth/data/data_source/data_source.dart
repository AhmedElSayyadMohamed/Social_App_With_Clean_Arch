import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/feature/auth/data/data_source/base_data_source.dart';

import '../../../../core/network/failure/failure.dart';
import '../../../../core/network/firebase_auth_exception_handler/firebase_auth_exception_handler.dart';
import '../models/user_model.dart';

class AuthDataSource extends BaseAuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    late UserCredential response;
    try{
      response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (exception) {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return UserModel.fromJson(response);
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    var response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    try {
      return UserModel.fromJson(response);
    } catch (error) {
      rethrow;
    }
  }
}
