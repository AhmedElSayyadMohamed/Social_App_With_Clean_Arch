import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/icon_broken/icon_broken.dart';
import 'package:social_app/feature/layout/presentation/business_logic/social_bloc.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../../core/router/routing_name.dart';
import '../../../../../utils/app_border/app_border.dart';
import '../../../../../utils/service_locator/service_locator.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppPadding.p12),
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.8),
        borderRadius: BorderRadiusDirectional.circular(AppBorder.b24),
      ),
      child: BlocBuilder<SocialBloc,SocialStates>(
            builder: (BuildContext context, SocialStates state) {
              var bloc = sl<SocialBloc>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => bloc.add(ToggleNavBarIndexEvent(0)),
                    icon: Icon(
                      IconBroken.home,
                      color:bloc.selectedIconColor(0),
                      size: bloc.selectedIconSize(0),
                    ),
                  ),
                  IconButton(
                    onPressed: () =>bloc.add(ToggleNavBarIndexEvent(1)),
                    icon: Icon(
                      IconBroken.chat,
                      color:bloc.selectedIconColor(1),
                      size: bloc.selectedIconSize(1),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.createPost);
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child:Icon(
                          Icons.add,
                          color:bloc.selectedIconColor(2),
                      size: bloc.selectedIconSize(2),
                        ),
                      ),
                    ),
                  ),
        
                  IconButton(
                    onPressed: () => bloc.add(ToggleNavBarIndexEvent(2)),
                    icon: Icon(
                      IconBroken.notification,
                      color:bloc.selectedIconColor(2),
                      size: bloc.selectedIconSize(2),
                    ),
                  ),
                 IconButton(
                    onPressed: () => bloc.add(ToggleNavBarIndexEvent(3)),
                    icon: Icon(
                      IconBroken.setting,
                      color:bloc.selectedIconColor(3),
                      size: bloc.selectedIconSize(3),
                    ),
                  ),
                
                ],
              );
            },
          ),
    );
  }
}
