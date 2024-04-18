import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/auth/domain/use_cases/base_auth_use_cases.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import '../../domain/use_cases/get_user_data.dart';
part 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileStates> {
  static ProfileBloc get(context) => BlocProvider.of(context);
  final GetUserDataUseCase _getUserDataUseCase;
  late final UserEntity user;
  ProfileBloc(this._getUserDataUseCase) : super(ProfileInitial()) {
    on<GetUserDataEvent>(_getUserData);
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
        print(user);
        this.user = user;
        emit(GetUserDataSuccessState(user));
      },
    );
  }

}
