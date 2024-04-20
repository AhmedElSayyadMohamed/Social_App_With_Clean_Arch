import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/domain/use_cases/base_feeds_use_cases.dart';

import '../base_repository/base_feed_repository.dart';

class UploadImageToFireStorageUseCase extends BaseFeedUseCases<String,Parameters>{
 final BaseFeedRepository feedRepository;

 UploadImageToFireStorageUseCase(this.feedRepository);

  @override
  Future<Either<Failure, String>> call(Parameters parameter) async{
     return await feedRepository.uploadPostImageToFireStorage(parameter.imageFile);
  }
}