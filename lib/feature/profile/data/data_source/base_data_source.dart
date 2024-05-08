import 'package:social_app/feature/profile/data/models/user_model.dart';

abstract class BaseProfileRemoteDataSource{

  Future<UserModel> getUserData(String uId);
  Future<List<UserModel>> getAllUsersData();
  Future<List<UserModel>> getFollowersData(List<dynamic> followersId);
  Future<List<UserModel>> getFollowingData(List<dynamic> followingId);
  Future<void> followUser({required String followUserId});
}