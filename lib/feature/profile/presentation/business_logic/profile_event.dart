part of 'profile_bloc.dart';

abstract class ProfileEvent {}
class GetUserDataEvent extends ProfileEvent {
  final String uId;

  GetUserDataEvent(this.uId);
}