import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants.dart';
import '../../../domain/use_cases/login_use_case.dart';
import 'login_states.dart';

class LoginBloc extends Cubit<LoginStates> {
  static LoginBloc get(context) => BlocProvider.of(context);

  final LoginWithEmailAndPasswordUseCase loginUseCase;
  bool isSecure = true;

  LoginBloc(this.loginUseCase) : super(LoginInitialState());

  Future<void> loginWithEmailAndPassword({
  required String email,
  required String password,
}) async {

    emit(LoginLoadingState());
    final result = await loginUseCase(
      Parameters(
        email: email,
        password: password,
      ),
    );
    result.fold(
      (l) {
        emit(LoginErrorState(l.msg));
      },
      (r) {
        currentUserId = r.uId;
        emit(LoginSuccessState());
      },
    );
  }

  void togglePasswordSecurityEyeIcon() {
    isSecure = !isSecure;
    emit(LoginPasswordSecurityState());
  }
}
