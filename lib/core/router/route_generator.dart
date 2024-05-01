import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/core/constants.dart';
import 'package:social_app/core/router/routing_name.dart';
import 'package:social_app/core/router/undefine_route.dart';
import 'package:social_app/feature/auth/presentation/screens/login_screen/login_screen.dart';
import 'package:social_app/feature/auth/presentation/screens/register_screen/register_screen.dart';
import 'package:social_app/feature/layout/presentation/screen/layout_screen.dart';
import 'package:social_app/feature/profile/domain/entities/user.dart';
import 'package:social_app/feature/profile/presentation/screen/following_screen.dart';

import '../../feature/feeds/presentation/screens/add_post.dart';
import '../../feature/profile/presentation/screen/followers_screen.dart';
import '../../feature/profile/presentation/screen/profile_following_follower_screen.dart';
import '../../feature/profile/presentation/screen/user_profile_screen.dart';

class RoutGenerator {
  static Route<dynamic> getRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.authenticationRoute:
        {
          if (FirebaseAuth.instance.currentUser !=null) {
            return MaterialPageRoute(builder: (_) => const LayoutScreen());
          } else {
            return MaterialPageRoute(builder: (_) => const LoginScreen());
          }
        }
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case Routes.layoutRoute:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );

      case Routes.profileRoute:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
        case Routes.createPost:
        return MaterialPageRoute(
          builder: (_) => const CreatePostScreen(),
        );
        case Routes.followersScreen:
        return MaterialPageRoute(
          builder: (_) => FollowersScreen(followers:setting.arguments as List,),
        );
        case Routes.followingScreen:
        return MaterialPageRoute(
          builder: (_) => FollowingScreen(following:setting.arguments as List,),
        );
        case Routes.followUserScreen:
        return MaterialPageRoute(
          builder: (_) => FollowUserScreen(uId:setting.arguments as String,),
        );

      default:
        return UnDefinedRoute.undefinedRoute();
    }
  }
}
