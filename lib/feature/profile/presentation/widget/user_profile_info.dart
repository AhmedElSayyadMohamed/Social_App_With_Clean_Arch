import 'package:flutter/material.dart';

import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/core/icon_broken/icon_broken.dart';

import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../core/basics_shared_widgets/custom_button/custom_button.dart';
import '../../../../utils/app_size/app_size.dart';
import '../../../../utils/strings_manager/strings_manager.dart';

class UserProfileInformation extends StatelessWidget {
  final String uId;
  const UserProfileInformation({super.key, required this.uId});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        AppSize.s1,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomButton(
                  onTap: () {},
                  borderRadius: AppPadding.p4,
                  buttonLabel: StringsManager.addStory,
                  buttonColor: Theme.of(context).scaffoldBackgroundColor,
                  borderColor: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                width: context.widthPercent(1.5),
              ),
              CustomButton(
                  onTap: () {},
                  borderRadius: AppPadding.p4,
                  buttonLabel: StringsManager.editProfile,
               
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(IconBroken.bag),
              SizedBox(
                width: 7,
              ),
              Flexible(
                child: Text(
                  'Software Engineer at Adwat Information Technology',
                ), //rebuild
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.school_outlined),
              SizedBox(
                width: 7,
              ),
              Flexible(
                child: Text(
                    'Studied at Faculty of Computer & Information kafr Sheikh university'), //rebuild
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(IconBroken.home),
              SizedBox(
                width: 7,
              ),
              Flexible(
                child: Text('Lives in Alexandria, Egypt'), //rebuild
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(IconBroken.location),
              SizedBox(
                width: 7,
              ),
              Flexible(
                child: Text('From Alexandria, Egypt'), //rebuild
              )
            ],
          ),
        ],
      ),
    );
  }
}
