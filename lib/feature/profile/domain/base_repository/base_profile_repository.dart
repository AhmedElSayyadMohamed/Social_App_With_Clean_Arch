import 'package:dartz/dartz.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import '../../../../core/network/failure/failure.dart';

abstract class BaseProfileRepository{

  Future<Either<Failure,UserEntity>> getUserData({required String uId});
  Future<Either<Failure,List<UserEntity>>> getFollowersData({required List<dynamic> followersId});
  Future<Either<Failure,List<UserEntity>>> getFollowingData({required List<dynamic> followingId});
  Future<Either<Failure,void>> followUser({required String followUserId});


}