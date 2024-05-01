import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import '../../../../../../../core/basics_shared_widgets/custom_text_form_field/custom_text_form_field.dart';
import '../../../../../../../core/basics_shared_widgets/flutter_toast/flutter_toast.dart';
import '../../../../../../../core/router/routing_name.dart';
import '../../../../../../../core/validation/email_validation/email_validation.dart';
import '../../../../../../../core/validation/password_validation/password_validation.dart';
import '../../../../../../../utils/app_border/app_border.dart';
import '../../../../../../../utils/app_padding/app_padding.dart';
import '../../../../../../../utils/app_size/app_size.dart';
import '../../../../../../../utils/service_locator/service_locator.dart';
import '../../../../../../../utils/strings_manager/strings_manager.dart';
import '../../../../business_logic/login_bloc/login_bloc.dart';
import '../../../../business_logic/login_bloc/login_events.dart';
import '../../../../business_logic/login_bloc/login_states.dart';
import '../../../../widget/auth_title_widget/auth_title_widget.dart';
import '../dont_have_account_text_widget/dont_have_account_text_widget.dart';
import '../forget_password_button/forget_password_button.dart';
import '../login_button/login_button.dart';
import '../toggle_eye_icon/toggle_eye_icon.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});
  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginStates>(
      builder: (context, state) {
        var cubit = LoginBloc.get(context);
        return Container(
          padding: const EdgeInsets.all(AppPadding.p20),
          decoration: BoxDecoration(
            color: Colors.indigo[50]!.withOpacity(0.6),
            borderRadius: const BorderRadiusDirectional.only(
              topStart: Radius.circular(AppBorder.b24),
              topEnd: Radius.circular(AppBorder.b24),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const AuthenticationTitleWidget(
                    screenName: StringsManager.signInTo,
                  ), // not rebuild
                  const SizedBox(
                    height: AppSize.s3,
                  ), // not rebuild
                  CustomTextFormField(
                    controller: emailController,
                    textFormLabel: StringsManager.email,
                    keyboardType: TextInputType.emailAddress,
                    formBorderRadius: AppPadding.p12,
                    validator: (email) =>
                        EmailValidator.checkEmailValidation(email),
                  ),
                  const SizedBox(
                    height: AppSize.s1,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    textFormLabel: StringsManager.password,
                    keyboardType: TextInputType.emailAddress,
                    formBorderRadius: AppPadding.p12,
                    obSecureText: cubit.isSecure,
                    suffixIcon: const ToggleEyeIcon(),
                    onFieldSubmitted: (value) =>
                        _checkFormValidationAndLoginWithEmailAndPassword,
                    validator: (password) =>
                        PasswordValidation.checkPasswordValidation(password),
                  ),
                  const ForgetPasswordButton(),
                  LoginButton(
                    onTap: () =>
                        _checkFormValidationAndLoginWithEmailAndPassword,
                  ),
                  const DontHaveAccountText(),
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, state) {
        if (state is LoginErrorState) {
          Alarm.flutterToast(
              massage: state.error, toastState: ToastState.error);
        } else if (state is LoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.layoutRoute, (_) => false);
        }
      },
    );
  }

  get _checkFormValidationAndLoginWithEmailAndPassword {
    if (formKey.currentState!.validate()) {
      sl<LoginBloc>().loginWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ).then((value) {
        if(currentUserId!=''){
          Navigator.pushReplacementNamed(context, Routes.layoutRoute);
        }
      });
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
