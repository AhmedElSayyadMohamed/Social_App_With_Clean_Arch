import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/data/remote_data_source/base_remote_data_source.dart';
import 'package:social_app/feature/feeds/domain/base_repository/base_feed_repository.dart';

class FeedRepository extends BaseFeedRepository {
  final BaseFeedRemoteDataSource feedRemoteDataSource;

  FeedRepository(this.feedRemoteDataSource);

  @override
  Future<Either<Failure, void>> createPostWithImage() async {
    final result = await feedRemoteDataSource.createPostWithImage();
    try {
      return Right(result);
    } catch (error) {
      return Left(ServerErrorException(msg: error.toString()));
    }
  }
}
