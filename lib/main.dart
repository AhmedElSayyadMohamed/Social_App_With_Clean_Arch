import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/utils/service_locator/service_locator.dart';
import 'application_root/application.dart';
import 'core/bloc_observer/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setUp;
  await Firebase.initializeApp();
  Bloc.observer = const AppBlocObserver();

  runApp(SocialApp());
}
