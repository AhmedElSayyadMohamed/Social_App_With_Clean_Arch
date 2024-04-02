import 'package:dartz/dartz.dart';
import '../../../../core/network/failure/failure.dart';
import '../entities/user.dart';

abstract class BaseAuthRepository{

  Future<Either<Failure,UserEntity>> loginWithEmailAndPassword({
        required String email,
        required String password,
      });

  Future<Either<Failure,UserEntity>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
}