import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/core/extension/responsive_context.dart';
import 'package:social_app/core/icon_broken/icon_broken.dart';
import 'package:social_app/feature/layout/presentation/bussiness_logic/social_bloc.dart';
import 'package:social_app/utils/app_padding/app_padding.dart';
import '../../../../../utils/app_border/app_border.dart';
import '../../../../../utils/service_locator/service_locator.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(AppBorder.b24),
        ),
        color: Colors.indigo[500]!.withOpacity(0.8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          height: context.heightPercent(8),
          child: BlocBuilder<SocialBloc,SocialStates>(
            builder: (BuildContext context, SocialStates state) {
              var bloc = SocialBloc.get(context);

              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () =>sl<SocialBloc>().add(ToggleNavBarIndexEvent(0)),
                    icon: Icon(
                      IconBroken.Home,
                      color:bloc.selectedIconColor(0),
                      size: bloc.selectedIconSize(0),
                    ),
                  ),
                  IconButton(
                    onPressed: () =>sl<SocialBloc>().add(ToggleNavBarIndexEvent(1)),
                    icon: Icon(
                      IconBroken.Search,
                      color:bloc.selectedIconColor(1),
                      size: bloc.selectedIconSize(1),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () =>sl<SocialBloc>().add(ToggleNavBarIndexEvent(2)),
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
                    onPressed: () =>sl<SocialBloc>().add(ToggleNavBarIndexEvent(3)),
                    icon: Icon(
                      IconBroken.Notification,
                      color:bloc.selectedIconColor(3),
                      size: bloc.selectedIconSize(3),
                    ),
                  ),
                  IconButton(
                    onPressed: () => sl<SocialBloc>().add(ToggleNavBarIndexEvent(4)),
                    icon: Icon(
                      IconBroken.Setting,
                      color:bloc.selectedIconColor(4),
                      size: bloc.selectedIconSize(4),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
