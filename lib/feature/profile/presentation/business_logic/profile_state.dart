
import 'package:social_app/feature/profile/domain/entities/user.dart';

abstract class ProfileStates {}

class ProfileInitial extends ProfileStates {}
class GetUserDataLoadingState extends ProfileStates {}
class GetUserDataSuccessState extends ProfileStates {
  final UserEntity user;

  GetUserDataSuccessState(this.user);
}
class GetUserDataErrorState extends ProfileStates {
  final String msg;

  GetUserDataErrorState(this.msg);
}
class GetFollowersDataLoadingState extends ProfileStates {}
class GetFollowersDataSuccessState extends ProfileStates {
  final List<UserEntity> followers;

  GetFollowersDataSuccessState(this.followers);
}
class GetFollowersDataErrorState extends ProfileStates {
  final String msg;
  GetFollowersDataErrorState(this.msg);
}
