import '../../domain/entities/post.dart';

abstract class BaseFeedRemoteDataSource{
  Future<String> uploadPostImageToFireStorage(String imageFile);
  Future<void> createPostWithImage(Post post);
}