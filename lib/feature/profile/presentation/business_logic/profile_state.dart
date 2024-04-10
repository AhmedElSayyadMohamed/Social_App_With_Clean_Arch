
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
