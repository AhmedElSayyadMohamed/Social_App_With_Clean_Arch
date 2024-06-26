import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_events.dart';
import 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  static LoginBloc get(context) => BlocProvider.of(context);

  final LoginWithEmailAndPasswordUseCase loginUseCase;
  bool isSecure = true;

  LoginBloc(this.loginUseCase) : super(LoginInitialState()) {
    on<LoginWithEmailAndPasswordEvent>(_loginWithEmailAndPassword);
    on<TogglePasswordSecurityEyeEvent>(_togglePasswordSecurityEyeIcon);
  }

  FutureOr<void> _loginWithEmailAndPassword(
    LoginWithEmailAndPasswordEvent event,
    Emitter<LoginStates> emit,
  ) async {
    emit(LoginLoadingState());
    final result = await loginUseCase(
      Parameters(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (l) {
        emit(LoginErrorState(l.msg));
      },
      (r) {
        if (kDebugMode) {
          print(r.uId);
        }
        emit(LoginSuccessState());
      },
    );
  }

  FutureOr<void> _togglePasswordSecurityEyeIcon(
    TogglePasswordSecurityEyeEvent event,
    Emitter<LoginStates> emit,
  ) {
    isSecure = !isSecure;
    emit(LoginPasswordSecurityState());
  }
}
