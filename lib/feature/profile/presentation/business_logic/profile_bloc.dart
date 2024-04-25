import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import 'package:social_app/feature/profile/domain/use_cases/get_followers_data.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import '../../../../core/constants.dart';
import '../../domain/use_cases/get_following_data.dart';
import '../../domain/use_cases/get_user_data.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  static ProfileBloc get(context) => BlocProvider.of(context);
  final GetUserDataUseCase _getUserDataUseCase;
  final GetFollowersDataUseCase _getFollowersDataUseCase;
  final GetFollowingDataUseCase _getFollowingDataUseCase;
  late final UserEntity user;

  ProfileBloc(
    this._getUserDataUseCase,
    this._getFollowersDataUseCase,
      this._getFollowingDataUseCase,
  ) : super(ProfileInitial()) {
    on<GetUserDataEvent>(_getUserData);
    on<GetFollowersDataEvent>(_getFollowersData);
    on<GetFollowingDataEvent>(_getFollowingData);
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
        this.user = user;
        emit(GetUserDataSuccessState(user));
      },
    );
  }

  FutureOr<void> _getFollowersData(
    GetFollowersDataEvent event,
    Emitter<ProfileStates> emit,
  ) async {
    emit(GetFollowersDataLoadingState());
    var result = await _getFollowersDataUseCase(Parameters(followersId: event.followersId));
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
      ) async{
    emit(GetFollowingDataLoadingState());
    var result = await _getFollowingDataUseCase(Parameters(followingId: event.followingId));
    result.fold(
          (left) {
        emit(GetFollowingDataErrorState(left.msg));
      },
          (following) {
        emit(GetFollowingDataSuccessState(following));
      },
    );
  }
}
