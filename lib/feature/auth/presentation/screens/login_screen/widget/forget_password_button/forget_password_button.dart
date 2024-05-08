import 'package:flutter/material.dart';
import '../../../../../../../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import '../../../../../../../utils/strings_manager/strings_manager.dart';

class ForgetPasswordButton extends StatelessWidget {

  const ForgetPasswordButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: CustomTextButton(
        onTap: (){},
        textColor: Colors.grey,
        buttonLabel: StringsManager.forgetPassword,
      ),
    );
  }
}
