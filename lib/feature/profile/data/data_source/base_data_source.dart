import 'package:social_app/feature/profile/data/models/user_model.dart';

abstract class BaseProfileRemoteDataSource{

  Future<UserModel> getUserData(String uId);
}