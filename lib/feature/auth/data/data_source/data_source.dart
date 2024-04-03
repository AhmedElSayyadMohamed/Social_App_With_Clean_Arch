import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/feature/auth/data/data_source/base_data_source.dart';
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
    } on FirebaseAuthException catch (_) {
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
    late UserCredential response;
    try{
      response = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
    return UserModel.fromJson(response);
  }
}
