import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import '../../../../core/constants.dart';
import '../base_repository/base_profile_repository.dart';
import 'base_profile_usecase.dart';

class GetAllUsersDataUseCase extends BaseProfileUseCases<List<UserEntity>,NoParameters>{
  final BaseProfileRepository _profileRepository;

  GetAllUsersDataUseCase(this._profileRepository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(NoParameters parameters) {
    return _profileRepository.getAllUsersData();
  }
}