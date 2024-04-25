import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import '../../../../core/constants.dart';
import '../base_repository/base_profile_repository.dart';
import 'base_profile_usecase.dart';

class GetUserDataUseCase extends BaseProfileUseCases<UserEntity,Parameters>{
  final BaseProfileRepository _profileRepository;

  GetUserDataUseCase(this._profileRepository);

  @override
  Future<Either<Failure, UserEntity>> call(Parameters parameters) {
    return _profileRepository.getUserData(uId:parameters.uId);
  }
}