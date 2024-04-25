
import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';
import '../../../../core/constants.dart';
import '../base_repository/base_feed_repository.dart';
import 'base_feeds_use_cases.dart';

class GetTimeLinePostsUseCase extends BaseFeedUseCases<List<Post>,Parameters>{
  final BaseFeedRepository feedRepository;

  GetTimeLinePostsUseCase(this.feedRepository);

  @override
  Future<Either<Failure,List<Post>>> call(Parameters parameter) async{
    return await feedRepository.getTimeLinePosts(parameter.followingId);
  }
}