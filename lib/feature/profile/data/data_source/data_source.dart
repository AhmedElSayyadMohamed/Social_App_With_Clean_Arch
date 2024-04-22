import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
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
        throw Exception("User data not found");
      }
    } catch (error) {
      // Handle specific errors if needed
      rethrow;
    }
  }

  @override
  Future<List<UserModel>> getFollowersData(List<dynamic> followersId) async {
    List<UserModel> followers = [];
    try {
      for (var followerId in followersId) {
        final doc = await _firebaseFirestore.collection("users").doc(followerId).get();
        followers.add(UserModel.fromJson(doc.data())) ;
      }} catch (error) {
      // Handle specific errors if needed
      rethrow;
    }
    if (kDebugMode) {
      print(followers);
    }
    return followers;
  }
}
