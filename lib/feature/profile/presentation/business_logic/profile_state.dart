
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
class GetAllUsersDataLoadingState extends ProfileStates {}
class GetAllUsersDataSuccessState extends ProfileStates {
  final List<UserEntity> users;

  GetAllUsersDataSuccessState(this.users);
}


class GetAllUsersDataErrorState extends ProfileStates {
  final String msg;

  GetAllUsersDataErrorState(this.msg);
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
class GetFollowingDataLoadingState extends ProfileStates {}
class GetFollowingDataSuccessState extends ProfileStates {
  final List<UserEntity> following;

  GetFollowingDataSuccessState(this.following);
}
class GetFollowingDataErrorState extends ProfileStates {
  final String msg;
  GetFollowingDataErrorState(this.msg);
}

class ToggleFollowingUserLoadingState extends ProfileStates {}
class ToggleFollowingUserSuccessState extends ProfileStates {}
class ToggleFollowingUserErrorState extends ProfileStates {
  final String msg;
  ToggleFollowingUserErrorState(this.msg);
}
class UserLogOutState extends ProfileStates {}
