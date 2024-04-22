import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/use_cases/base_auth_use_cases.dart';
import '../../../domain/use_cases/register_use_case.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  static RegisterBloc get(context) => BlocProvider.of(context);
  bool isSecure = true;

  final SignUpUseCase _signUpUseCase;

  RegisterBloc(this._signUpUseCase) : super(RegisterInitial()) {
    on<RegisterNewUserEvent>(_registerNewUser);
    on<UploadNewUserDataToFireStore>(_uploadNewUserDataToFireStore);
    on<TogglePasswordSecurityEyeEvent>(_togglePasswordSecurityEyeIcon);
  }

  FutureOr<void> _registerNewUser(
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
      (left) {
        emit(RegisterErrorState(left.msg));
      },
      (right) {

        add(UploadNewUserDataToFireStore(right));
        emit(RegisterSuccessState());
      },
    );
  }


  FutureOr<void> _uploadNewUserDataToFireStore(
    UploadNewUserDataToFireStore event,
    Emitter<RegisterStates> emit,
  ) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(event.newUser.uId)
        .set(event.newUser.toJson())
        .then(
      (value) {
        emit(UploadNewUserDataToFireStoreSuccessState());
        if (kDebugMode) {
          print('User data saved successfully!');
        }
      },
    ).catchError(
      (error) {
        emit(UploadNewUserDataToFireStoreErrorState(error.toString()));
        if (kDebugMode) {
          print('Error saving user data: $error');
        }
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
