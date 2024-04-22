import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../core/basics_shared_widgets/custom_button/custom_button.dart';
import '../../../../utils/app_size/app_size.dart';
import '../../../../utils/strings_manager/strings_manager.dart';

class UserProfileInformation extends StatelessWidget {
  const UserProfileInformation({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSize.s1,
      ),
      child: BlocBuilder<ProfileBloc, ProfileStates>(
        builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: () {},
                    height: 40,
                    width: context.widthPercent(AppSize.s6),
                    borderRadius: AppPadding.p4,
                    buttonLabel: StringsManager.follow,
                    buttonColor: Theme.of(context).scaffoldBackgroundColor,
                    borderColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: context.widthPercent(2),
                  ),
                  CustomButton(
                    onTap: () {},
                    height: 40,
                    width: context.widthPercent(AppSize.s3),
                    borderRadius: AppPadding.p4,
                    buttonLabel: StringsManager.edit,
                    buttonColor: Theme.of(context).scaffoldBackgroundColor,
                    borderColor: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
