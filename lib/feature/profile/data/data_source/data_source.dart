import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/profile/data/models/user_model.dart';
import 'base_data_source.dart';

class ProfileRemoteDataSource extends BaseProfileRemoteDataSource {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> getUserData(String uId) async {
    try {
      final doc = await _firebaseFirestore.collection("users").doc(uId).get();
      if (doc.exists) {
        return UserModel.fromJson(doc.data());
      } else {
        throw ServerErrorException(msg: "User data not found");
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getFollowersData(List<dynamic> followersId) async {
    List<UserModel> followers = [];
    try {
      for (var followerId in followersId) {
        final doc =
            await _firebaseFirestore.collection("users").doc(followerId).get();
        followers.add(UserModel.fromJson(doc.data()));
      }
    } catch (error) {
      rethrow;
    }

    return followers;
  }

  @override
  Future<List<UserModel>> getFollowingData(List<dynamic> followingId) async {
    List<UserModel> following = [];
    try {
      for (var followingId in followingId) {
        final doc =
            await _firebaseFirestore.collection("users").doc(followingId).get();
        following.add(UserModel.fromJson(doc.data()));
      }
    } catch (error) {
      rethrow;
    }
    return following;
  }
}
