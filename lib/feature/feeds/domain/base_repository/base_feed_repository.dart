import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';

abstract class BaseFeedRepository{

Future<Either<Failure,void>> addPost(Post post);
Future<Either<Failure,void>> likePost(Post post);
Future<Either<Failure,List<Post>>> getMyPostsById(String uId);
}