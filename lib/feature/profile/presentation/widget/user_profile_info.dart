import 'package:flutter/material.dart';
import 'package:social_app/core/extension/responsive_context.dart';

import '../../../../core/basics_shared_widgets/custom_button/custom_button.dart';
import '../../../../utils/app_size/app_size.dart';
import '../../../../utils/strings_manager/strings_manager.dart';

class UserProfileInformation extends StatelessWidget {
  const UserProfileInformation({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSize.s1),
      child: Column(
        children: [
          CustomButton(
            onTap: () {},
            height: 40,
            width: context.widthPercent(AppSize.s4),
            borderRadius: 5,
            buttonLabel: StringsManager.follow,
            buttonColor: Theme.of(context).scaffoldBackgroundColor,
            borderColor: Theme.of(context).primaryColor,
            textColor: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            height: AppSize.s2,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        '8',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Posts",
                        style: Theme.of(context).textTheme.bodyText1,
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
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        "images",
                        style: Theme.of(context).textTheme.bodyText1,
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
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Following",
                          style: Theme.of(context).textTheme.bodyText1)
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
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text("Followers",
                          style: Theme.of(context).textTheme.bodyText1)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
