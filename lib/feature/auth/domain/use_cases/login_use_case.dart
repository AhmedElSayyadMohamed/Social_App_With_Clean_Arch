import 'package:dartz/dartz.dart';
import 'package:social_app/feature/auth/domain/use_cases/base_auth_use_cases.dart';
import '../../../../core/network/failure/failure.dart';
import '../base_repository/base_auth_repository.dart';
import '../entities/user.dart';

class LoginWithEmailAndPasswordUseCase extends BaseAuthUseCases<UserEntity,Parameters>{
  final BaseAuthRepository _baseRepository;

  LoginWithEmailAndPasswordUseCase(this._baseRepository);

  @override
  Future<Either<Failure, UserEntity>> call(Parameters parameter) async {
    return await _baseRepository.loginWithEmailAndPassword(
        email:parameter.email!,
        password:parameter.password!,
    );
  }
}