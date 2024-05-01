import 'package:dartz/dartz.dart';
import 'package:social_app/feature/profile/domain/use_cases/base_profile_usecase.dart';
import '../../../../core/constants.dart';
import '../../../../core/network/failure/failure.dart';
import '../base_repository/base_profile_repository.dart';

class FollowUserUseCase extends BaseProfileUseCases<void,Parameters>{
  final BaseProfileRepository _profileRepository;

  FollowUserUseCase(this._profileRepository);

  @override
  Future<Either<Failure, void>> call(Parameters parameters) {
    return _profileRepository
        .followUser(
        followUserId: parameters.uId,
    );
  }
}