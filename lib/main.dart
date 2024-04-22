import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/utils/service_locator/service_locator.dart';
import 'application_root/application.dart';
import 'core/bloc_observer/bloc_observer.dart';

void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set up ServiceLocator and initialize Firebase asynchronously
  await Future.wait([
    ServiceLocator().setUp,
    Firebase.initializeApp(),
  ]);

  // Set up Bloc observer
  Bloc.observer = const AppBlocObserver();

  // Run the app
  runApp(SocialApp());
}
