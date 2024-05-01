import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/feeds/presentation/bussiness_logic/feeds_bloc.dart';
import 'package:social_app/feature/layout/presentation/bussiness_logic/social_bloc.dart';
import 'package:social_app/feature/layout/presentation/widget/constants.dart';
import '../../../../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import '../../../../core/constants.dart';
import '../../../../core/router/routing_name.dart';
import '../../../../utils/service_locator/service_locator.dart';
import '../../../profile/presentation/business_logic/profile_bloc.dart';
import '../widget/app_bar/app_bar.dart';
import '../widget/bottom_nav_bar/bottom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialBloc, SocialStates>(
        builder: (context, state) {
          var bloc = SocialBloc.get(context);
          return Scaffold(
            appBar: CustomLayoutAppBar(
              title: screensTitles[bloc.navBarIndex],
            ),
            drawer: Drawer(
              child:SafeArea(
            child: Column(
                children: [
                  Container(
                    color: Colors.redAccent,
                    child: CustomTextButton(
                      onTap: () async {
                        ProfileBloc.get(context).add(LogOutEvent());
                        Navigator.pushReplacementNamed(context, Routes.loginRoute);
                      },
                      buttonLabel: 'logout',
                    ),
                  )
                ],
              ),
            ),),
            body: Stack(
              fit: StackFit.passthrough,
              children: [
                screens(bloc.navBarIndex),
                const Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: CustomBottomNavBar(),
                )
              ],
            ),
          );
        },
    );
  }
}
