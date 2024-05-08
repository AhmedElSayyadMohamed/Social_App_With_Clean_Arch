import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/layout/presentation/business_logic/social_bloc.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import 'package:social_app/feature/profile/domain/use_cases/follow_user_use_case.dart';
import 'package:social_app/feature/profile/domain/use_cases/get_all_users_usecase.dart';
import 'package:social_app/feature/profile/domain/use_cases/get_followers_data.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/service_locator/service_locator.dart';
import '../../../../core/constants.dart';
import '../../../../utils/strings_manager/strings_manager.dart';
import '../../domain/use_cases/get_following_data.dart';
import '../../domain/use_cases/get_user_data.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {

  static ProfileBloc get(context) => BlocProvider.of(context);
  
  final GetUserDataUseCase _getUserDataUseCase;
  final GetAllUsersDataUseCase _getAllUsersDataUseCase;

  final GetFollowersDataUseCase _getFollowersDataUseCase;
  final GetFollowingDataUseCase _getFollowingDataUseCase;
  final FollowUserUseCase _followUserUseCase;

  ProfileBloc(
    this._getUserDataUseCase,
    this._getFollowersDataUseCase,
    this._getFollowingDataUseCase,
    this._followUserUseCase,
     this._getAllUsersDataUseCase,
  ) : super(ProfileInitial()) {
    on<GetUserDataEvent>(_getUserData);
    on<GetFollowersDataEvent>(_getFollowersData);
    on<GetFollowingDataEvent>(_getFollowingData);
    on<ToggleFollowingUserEvent>(_toggleFollowUser);
    on<GetAllUsersDataEvent>(_getAllUsersData);
    on<LogOutEvent>(_userLogOut);

  }

  FutureOr<void> _getUserData(
    GetUserDataEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(GetUserDataLoadingState());
    var result = await _getUserDataUseCase(Parameters(uId: event.uId));
    result.fold(
      (left) {
        emit(GetUserDataErrorState(left.msg));
      },
      (user) {
        emit(GetUserDataSuccessState(user));
      },
    );
  }

  FutureOr<void> _getFollowersData(
    GetFollowersDataEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(GetFollowersDataLoadingState());
    var result = await _getFollowersDataUseCase(
        Parameters(followersId: event.followersId));
    result.fold(
      (left) {
        emit(GetFollowersDataErrorState(left.msg));
      },
      (followers) {
        emit(GetFollowersDataSuccessState(followers));
      },
    );
  }

  FutureOr<void> _getFollowingData(
    GetFollowingDataEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(GetFollowingDataLoadingState());
    var result = await _getFollowingDataUseCase(
        Parameters(followingId: event.followingId));
    result.fold(
      (left) {
        emit(GetFollowingDataErrorState(left.msg));
      },
      (following) {
        emit(GetFollowingDataSuccessState(following));
      },
    );
  }

  FutureOr<void> _toggleFollowUser(
    ToggleFollowingUserEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(ToggleFollowingUserLoadingState());
    var result = await _followUserUseCase(
      Parameters(
        uId: event.followingUserId,
      ),
    );
    result.fold(
      (left) {
        emit(ToggleFollowingUserErrorState(left.msg));
      },
      (right) {
        emit(ToggleFollowingUserSuccessState());
      },
    );
  }

  FutureOr<void> _userLogOut(
    LogOutEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    await FirebaseAuth.instance.signOut().then((value) {
      currentUserId = '';
    });
    sl<SocialBloc>().add(ToggleNavBarIndexEvent(0));
    emit(UserLogOutState());
  }

  String toggleFollowingButton({
    required UserEntity user,
  }) {
    String label = 'Follows';
    if (user.followers.contains(user.uId)) {
      if (user.following.contains(user.uId)) {
        label = 'Following';
      } else {
        label = 'FollowBack';
      }
    } else {
      if (user.following.contains(user.uId)) {
        label = 'Following';
      } else {
        label = StringsManager.follow;
      }
    }
    // emit(ToggleFollowingUserSuccessState());
    return label;
  }

  FutureOr<void> _getAllUsersData(
    GetAllUsersDataEvent event,
     Emitter<ProfileStates> emit,
     ) async{
       emit(GetAllUsersDataLoadingState());
    var result = await _getAllUsersDataUseCase(NoParameters());
    result.fold(
      (left) {
        emit(GetAllUsersDataErrorState(left.msg));
      },
      (users) {
        emit(GetAllUsersDataSuccessState(users));
      },
    );
  }
}
