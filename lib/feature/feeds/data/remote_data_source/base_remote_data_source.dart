import 'package:social_app/feature/feeds/data/models/post_model.dart';

import '../../domain/entities/post.dart';

abstract class BaseFeedRemoteDataSource{
  Future<String> uploadPostImageToFireStorage(String imageFile);
  Future<void> addPost(Post post);
  Future<void> likePost(Post post);
  Future<List<PostModel>> getMyPostsById(String uId);
  Future<List<PostModel>> getTimeLinePosts(List<dynamic> followingUsersId);

}