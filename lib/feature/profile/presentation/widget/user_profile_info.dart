import 'package:flutter/material.dart';
import 'package:social_app/core/extension/responsive_context.dart';
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
          vertical: AppSize.s2,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        '8',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Posts",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        "8k",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "images",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        "8.2k",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Following",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        "8k",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Followers",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: AppSize.s2,
          ),
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
      ),
    );
  }
}
