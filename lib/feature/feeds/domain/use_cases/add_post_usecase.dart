import 'package:dartz/dartz.dart';

import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';

import '../base_repository/base_feed_repository.dart';
import 'base_feeds_use_cases.dart';

class AddPostUseCase extends BaseFeedUseCases<void,Post>{
  final BaseFeedRepository feedRepository;

  AddPostUseCase(this.feedRepository);

  @override
  Future<Either<Failure, dynamic>> call(Post parameter) async{
     return await feedRepository.addPost(parameter);
  }
}