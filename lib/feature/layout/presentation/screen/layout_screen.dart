import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/layout/presentation/bussiness_logic/social_bloc.dart';
import 'package:social_app/feature/layout/presentation/widget/constants.dart';
import '../widget/app_bar/app_bar.dart';
import '../widget/bottom_nav_bar/bottom_nav_bar.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SocialBloc, SocialStates>(
        builder: (context, state) {
          var bloc = SocialBloc.get(context);
          return Scaffold(
            appBar: CustomLayoutAppBar(
              title: screensTitles[bloc.navBarIndex],
            ),
            body: Stack(
              fit: StackFit.passthrough,
              children: [
                 screens(bloc.navBarIndex),
                const Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child:  CustomBottomNavBar(),
                )
              ],
            ),
          );
        },
    );
  }
}
