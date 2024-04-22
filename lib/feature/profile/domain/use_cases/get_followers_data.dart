import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import '../../../auth/domain/use_cases/base_auth_use_cases.dart';
import '../base_repository/base_profile_repository.dart';
import 'base_profile_usecase.dart';

class GetFollowersDataUseCase extends BaseProfileUseCases<List<UserEntity>,Parameters>{
  final BaseProfileRepository _profileRepository;

  GetFollowersDataUseCase(this._profileRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(Parameters parameters) {
   return _profileRepository.getFollowersDataUseCase(followersId: parameters.followersId!);
  }


}