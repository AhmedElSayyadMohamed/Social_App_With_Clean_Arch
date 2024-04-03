import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/use_cases/base_auth_use_cases.dart';
import '../../../domain/use_cases/register_use_case.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  static RegisterBloc get(context) => BlocProvider.of(context);
  bool isSecure = true;

  final SignUpUseCase _signUpUseCase;

  RegisterBloc(this._signUpUseCase) : super(RegisterInitial()) {
    on<RegisterNewUserEvent>(_registerNewUserEvent);
    on<TogglePasswordSecurityEyeEvent>(_togglePasswordSecurityEyeIcon);
  }

  FutureOr<void> _registerNewUserEvent(
    RegisterNewUserEvent event,
    Emitter<RegisterStates> emit,
  ) async {

    emit(RegisterLoadingState());

    final result = await _signUpUseCase(
      Parameters(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (l) {
        emit(RegisterErrorState(l.msg));
      },
      (r) {
        emit(RegisterSuccessState());
      },
    );
  }

  FutureOr<void> _togglePasswordSecurityEyeIcon(
    TogglePasswordSecurityEyeEvent event,
    Emitter<RegisterStates> emit,
  ) {
    isSecure = !isSecure;
    emit(RegisterPasswordSecurityState());
  }
}
