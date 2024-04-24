import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import '../base_repository/base_feed_repository.dart';
import 'base_feeds_use_cases.dart';

class ToggleLikePostAndGetPostLikesUseCase extends BaseFeedUseCases<List<String>,Parameters>{
  final BaseFeedRepository feedRepository;

  ToggleLikePostAndGetPostLikesUseCase(this.feedRepository);

  @override
  Future<Either<Failure,List<String>>> call(Parameters parameter) async{
    return await feedRepository.toggleLikePostAndGetPostLikes(parameter.postId);
  }
}