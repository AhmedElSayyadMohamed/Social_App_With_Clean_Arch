import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/core/icon_broken/icon_broken.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_bloc.dart';
import 'package:social_app/feature/profile/presentation/business_logic/profile_state.dart';
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
      child:  BlocBuilder<ProfileBloc, ProfileStates>(
          builder: (context, state) {
            switch(state){
              case GetUserDataLoadingState _:return const CircularProgressIndicator() ;
              case GetUserDataSuccessState _:  return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: uId != currentUserId,
                    replacement: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          onTap: () {},
                          height: 40,
                          width: context.widthPercent(AppSize.s6),
                          borderRadius: AppPadding.p4,
                          buttonLabel: StringsManager.addStory,
                          buttonColor: Theme.of(context).scaffoldBackgroundColor,
                          borderColor: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: context.widthPercent(1.5),
                        ),
                        CustomButton(
                          onTap: () {},
                          height: 40,
                          width: context.widthPercent(AppSize.s3),
                          borderRadius: AppPadding.p4,
                          buttonLabel: StringsManager.editProfile,
                          buttonColor: Theme.of(context).scaffoldBackgroundColor,
                          borderColor: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          onTap: () {
                            // bloc.add(
                            //   ToggleFollowingUserEvent(
                            //     followingUserId: uId,
                            //   ),
                            // );
                            // bloc.add(GetUserDataEvent(uId));
                          },
                          height: 40,
                          width: context.widthPercent(AppSize.s6),
                          borderRadius: AppPadding.p4,
                          buttonLabel: state.user.followers.contains(uId)
                              ? (state.user.following.contains(uId)
                              ? 'Following'
                              : 'FollowBack')
                              : (state.user.following.contains(uId)
                              ? 'Following'
                              : StringsManager.follow),
                          buttonColor: Theme.of(context).scaffoldBackgroundColor,
                          borderColor: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryColor,
                        ),
                        SizedBox(
                          width: context.widthPercent(1.5),
                        ),
                        CustomButton(
                          onTap: () {},
                          height: 40,
                          width: context.widthPercent(AppSize.s3),
                          borderRadius: AppPadding.p4,
                          buttonLabel: StringsManager.messageFriend,
                          buttonColor: Theme.of(context).scaffoldBackgroundColor,
                          borderColor: Theme.of(context).primaryColor,
                          textColor: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),

                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // const Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Icon(IconBroken.bag),
                  //     SizedBox(
                  //       width: 7,
                  //     ),
                  //     Flexible(
                  //       child: Text(
                  //         'Software Engineer at Adwat Information Technology',
                  //       ), //rebuild
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // const Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Icon(Icons.school_outlined),
                  //     SizedBox(
                  //       width: 7,
                  //     ),
                  //     Flexible(
                  //       child: Text(
                  //           'Studied at Faculty of Computer & Information kafr Sheikh university'), //rebuild
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // const Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Icon(IconBroken.home),
                  //     SizedBox(
                  //       width: 7,
                  //     ),
                  //     Flexible(
                  //       child: Text('Lives in Alexandria, Egypt'), //rebuild
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  // const Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Icon(IconBroken.location),
                  //     SizedBox(
                  //       width: 7,
                  //     ),
                  //     Flexible(
                  //       child: Text('From Alexandria, Egypt'), //rebuild
                  //     )
                  //   ],
                  // ),
                ],
              );
              case GetUserDataErrorState _:return Text(state.msg) ;
              default :return Text('default case') ;
            }
           
          },
      ),
    );
  }
}
