
import '../models/user_model.dart';

abstract class BaseAuthDataSource{

  Future<UserModel> loginWithEmailAndPassword(String email,String password);
  Future<UserModel> signUpWithEmailAndPassword(String email,String password);
}