import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/domain/use_cases/base_feeds_use_cases.dart';

import '../base_repository/base_feed_repository.dart';

class CreatePostWithImageUseCase extends BaseFeedUseCases<void,NoParameters>{
 final BaseFeedRepository feedRepository;

 CreatePostWithImageUseCase(this.feedRepository);

  @override
  Future<Either<Failure, dynamic>> call(parameter) {
     return feedRepository.createPostWithImage();
  }

}