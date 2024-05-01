import 'package:firebase_auth/firebase_auth.dart';

import '../feature/feeds/domain/entities/post.dart';

String currentUserId = FirebaseAuth.instance.currentUser!.uid;



class Parameters {
  final String uId;
  final String email;
  final String password;
  final String imageFile;
  final Post? post;
  final List<dynamic> followersId;
  final List<dynamic> followingId;

  Parameters({
    this.email ='',
    this.password ='',
    this.post,
    this.followersId = const [],
    this.followingId = const [],
    this.imageFile = '',
    this.uId = '',
  });
}

class NoParameters {}
