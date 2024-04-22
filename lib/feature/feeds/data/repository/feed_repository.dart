import 'package:dartz/dartz.dart';
import 'package:social_app/feature/feeds/data/remote_data_source/base_remote_data_source.dart';
import 'package:social_app/feature/feeds/domain/base_repository/base_feed_repository.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';
import '../../../../core/network/failure/failure.dart';

class FeedRepository extends BaseFeedRepository {
  final BaseFeedRemoteDataSource feedRemoteDataSource;

  FeedRepository(this.feedRemoteDataSource);

  @override
  Future<Either<Failure, String>> uploadPostImageToFireStorage(String imageFile) async {
    final result = await feedRemoteDataSource.uploadPostImageToFireStorage(imageFile);
    try {
      return Right(result);
    } catch (error) {
      return Left(ServerErrorException(msg: error.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> createPostWithImage(Post post) async{
    final result = await feedRemoteDataSource.createPostWithImage(post);
    try {
      return Right(result);
    } catch (error) {
      return Left(ServerErrorException(msg: error.toString()));
    }
  }

  @override
  Future<Either<Failure,List<Post>>> getMyPostsById(String uId) async{
    final result = await feedRemoteDataSource.getMyPostsById(uId);
    try {
      return Right(result);
    } catch (error) {
      return Left(ServerErrorException(msg: error.toString()));
    }
  }
}
