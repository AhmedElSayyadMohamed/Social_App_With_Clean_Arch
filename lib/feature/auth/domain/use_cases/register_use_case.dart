import 'package:dartz/dartz.dart';
import 'package:social_app/feature/auth/domain/use_cases/base_auth_use_cases.dart';
import '../../../../core/network/failure/failure.dart';
import '../../data/models/user_model.dart';
import '../base_repository/base_auth_repository.dart';

class SignUpUseCase extends BaseAuthUseCases<UserModel, Parameters> {
  final BaseAuthRepository _baseRepository;

  SignUpUseCase(this._baseRepository);

  @override
  Future<Either<Failure, UserModel>> call(Parameters parameter) {
    return _baseRepository.signUpWithEmailAndPassword(
      email: parameter.email!,
      password: parameter.password!,
    );
  }
}
