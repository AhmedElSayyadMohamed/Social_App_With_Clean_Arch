import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/profile/data/data_source/base_data_source.dart';
import 'package:social_app/feature/profile/domain/base_repository/base_profile_repository.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';

class ProfileRepository extends BaseProfileRepository {
  final BaseProfileRemoteDataSource _profileRemoteDataSource;
  ProfileRepository(this._profileRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getUserData({required String uId})async {
    final result = await _profileRemoteDataSource.getUserData(uId);
    try{
      return Right(result);
    }on FirebaseException catch(error){
      return Left(ServerErrorException(msg:error.message.toString()));
    }
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getFollowersDataUseCase({required List<dynamic> followersId}) async {
    final result = await _profileRemoteDataSource.getFollowersData(followersId);
    try{
      return Right(result);
    }on FirebaseException catch(error){
      return Left(ServerErrorException(msg:error.message.toString()));
    }
  }
}
