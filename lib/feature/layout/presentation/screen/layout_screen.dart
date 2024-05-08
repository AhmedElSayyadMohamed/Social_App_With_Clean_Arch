import 'package:flutter/material.dart';
import '../widget/app_bar/app_bar.dart';
import '../widget/bottom_nav_bar/bottom_nav_bar.dart';
import '../widget/layout_body.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: CustomLayoutAppBar(),
          body: const Stack(
            children: [
              LayoutBody(),
              Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: CustomBottomNavBar(),
              )
            ],
          ),
        );
  }
}
