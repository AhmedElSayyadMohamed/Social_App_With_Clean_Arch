import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import '../base_repository/base_feed_repository.dart';
import 'base_feeds_use_cases.dart';

class LikePostUseCase extends BaseFeedUseCases<void,Parameters>{
  final BaseFeedRepository feedRepository;

  LikePostUseCase(this.feedRepository);

  @override
  Future<Either<Failure,void>> call(Parameters parameter) async{
    return await feedRepository.likePost(parameter.post!);
  }
}