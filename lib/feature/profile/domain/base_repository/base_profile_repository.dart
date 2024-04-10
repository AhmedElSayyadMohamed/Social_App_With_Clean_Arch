import 'package:dartz/dartz.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import '../../../../core/network/failure/failure.dart';

abstract class BaseProfileRepository{

  Future<Either<Failure,UserEntity>> getUserData({required String uId});

}