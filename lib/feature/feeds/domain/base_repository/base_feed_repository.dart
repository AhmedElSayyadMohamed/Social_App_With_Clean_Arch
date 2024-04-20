import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';

abstract class BaseFeedRepository{

Future<Either<Failure,String?>> uploadPostImageToFireStorage(String imageFile);
Future<Either<Failure,void>> createPostWithImage(Post post);
}