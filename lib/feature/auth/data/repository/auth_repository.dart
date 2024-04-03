import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/auth/data/data_source/base_data_source.dart';
import 'package:social_app/feature/auth/data/models/user_model.dart';
import 'package:social_app/feature/auth/domain/base_repository/base_auth_repository.dart';
import 'package:social_app/feature/auth/domain/entities/user.dart';

import '../../../../core/network/firebase_auth_exception_handler/firebase_auth_exception_handler.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthDataSource _authDataSource;
  AuthRepository(this._authDataSource);

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final UserModel result;
    try {
      result = await _authDataSource.loginWithEmailAndPassword(email, password);
      return Right(result);
    } on FirebaseAuthException catch (exception) {
      return Left(
        ServerErrorException(
          msg: FirebaseAuthExceptionHandler.handleException(exception),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final UserModel result;
    try {
      result = await _authDataSource.signUpWithEmailAndPassword(email, password);
      return Right(result);
    } on FirebaseAuthException catch (exception) {
      return Left(
        ServerErrorException(
          msg: FirebaseAuthExceptionHandler.handleException(exception),
        ),
      );
    }
  }
}
