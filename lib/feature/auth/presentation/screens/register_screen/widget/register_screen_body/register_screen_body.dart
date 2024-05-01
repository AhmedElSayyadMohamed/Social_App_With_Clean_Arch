import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/basics_shared_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../../../../../../core/basics_shared_widgets/flutter_toast/flutter_toast.dart';
import '../../../../../../../core/constants.dart';
import '../../../../../../../core/router/routing_name.dart';
import '../../../../../../../core/validation/email_validation/email_validation.dart';
import '../../../../../../../core/validation/password_validation/password_validation.dart';
import '../../../../../../../core/validation/phone_validation/phone_validation.dart';
import '../../../../../../../core/validation/user_name_validation/user_name_validation.dart';
import '../../../../../../../utils/app_padding/app_padding.dart';
import '../../../../../../../utils/app_size/app_size.dart';
import '../../../../../../../utils/service_locator/service_locator.dart';
import '../../../../../../../utils/strings_manager/strings_manager.dart';
import '../../../../business_logic/register_bloc/register_bloc.dart';
import '../../../../widget/auth_title_widget/auth_title_widget.dart';
import '../register_button/register_button.dart';
import '../toggle_scure_eye_icon/toggle_secure_eye_icon.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => RegisterScreenBodyState();
}

class RegisterScreenBodyState extends State<RegisterScreenBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterStates>(
      builder: (BuildContext context, RegisterStates state) {
        var cubit = RegisterBloc.get(context);
        return Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthenticationTitleWidget(
                      screenName: StringsManager.welcome,
                    ),
                    const SizedBox(
                      height: AppSize.s5,
                    ),
                    CustomTextFormField(
                      controller: userNameController,
                      textFormLabel: StringsManager.userName,
                      keyboardType: TextInputType.text,
                      formBorderRadius: AppPadding.p20,
                      validator: (userName) =>
                          NameValidator.checkNameValidation(userName),
                    ),
                    const SizedBox(
                      height: AppSize.s1,
                    ),
                    CustomTextFormField(
                      controller: emailController,
                      textFormLabel: StringsManager.email,
                      keyboardType: TextInputType.emailAddress,
                      formBorderRadius: AppPadding.p20,
                      validator: (email) =>
                          EmailValidator.checkEmailValidation(email),
                    ),
                    const SizedBox(
                      height: AppSize.s1,
                    ),
                    CustomTextFormField(
                      controller: phoneController,
                      textFormLabel: StringsManager.phone,
                      keyboardType: TextInputType.number,
                      formBorderRadius: AppPadding.p20,
                      validator: (email) =>
                          PhoneValidator.checkPhoneValidation(email),
                    ),
                    const SizedBox(
                      height: AppSize.s1,
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      textFormLabel: StringsManager.password,
                      keyboardType: TextInputType.emailAddress,
                      formBorderRadius: AppPadding.p20,
                      obSecureText: cubit.isSecure,
                      suffixIcon: const RegisterToggleEyeIcon(),
                      onFieldSubmitted: (value) =>
                          _checkFormValidationAndRegisterWithEmailAndPassword,
                      validator: (password) =>
                          PasswordValidation.checkPasswordValidation(password),
                    ),
                    const SizedBox(
                      height: AppSize.s1,
                    ),
                    CustomTextFormField(
                      controller: confirmPasswordController,
                      textFormLabel: StringsManager.confirmPassword,
                      keyboardType: TextInputType.emailAddress,
                      formBorderRadius: AppPadding.p20,
                      obSecureText: cubit.isSecure,
                      onFieldSubmitted: (value) =>
                          _checkFormValidationAndRegisterWithEmailAndPassword,
                      validator: (password) =>
                          PasswordValidation.checkPasswordValidation(password),
                    ),
                    const SizedBox(
                      height: AppSize.s3,
                    ),
                    RegisterButton(
                      onTap: () =>
                          _checkFormValidationAndRegisterWithEmailAndPassword,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {
        if (state is UploadNewUserDataToFireStoreSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.layoutRoute,
            (route) => false,
          );
        } else if (state is RegisterErrorState) {
          Alarm.flutterToast(
            massage: state.msg,
            toastState: ToastState.error,
          );
        } else if (state is UploadNewUserDataToFireStoreErrorState) {
          Alarm.flutterToast(
            massage: state.msg,
            toastState: ToastState.error,
          );
        }
      },
    );
  }

  get _checkFormValidationAndRegisterWithEmailAndPassword {
    if (formKey.currentState!.validate()) {
      sl<RegisterBloc>().add(
        RegisterNewUserEvent(
          userName: userNameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
        ),
      );

      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
