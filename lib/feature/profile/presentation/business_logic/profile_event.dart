part of 'profile_bloc.dart';

abstract class ProfileEvent {}

class GetUserDataEvent extends ProfileEvent {
  final String uId;

  GetUserDataEvent(this.uId);
}

class GetFollowersDataEvent extends ProfileEvent {
  final List<dynamic> followersId;
  GetFollowersDataEvent(this.followersId);
}

class GetFollowingDataEvent extends ProfileEvent {
  final List<dynamic> followingId;
  GetFollowingDataEvent(this.followingId);
}

class ToggleFollowingUserEvent extends ProfileEvent {
  final String followingUserId;
  ToggleFollowingUserEvent({required this.followingUserId});
}

class LogOutEvent extends ProfileEvent {}
