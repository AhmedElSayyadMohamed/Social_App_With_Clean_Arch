import 'package:firebase_auth/firebase_auth.dart';

final String currentUserId = FirebaseAuth.instance.currentUser!.uid;