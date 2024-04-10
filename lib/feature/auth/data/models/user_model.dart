import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/feature/auth/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uId,
    required super.photo,
    required super.name,
    required super.phone,
    required super.email,
    required super.profileCover,
    required super.bio,
  });

  factory UserModel.fromJson(UserCredential userCredential) => UserModel(
        uId: userCredential.user!.uid,
        email: userCredential.user!.email ?? 'example@example.com',
        photo: userCredential.user!.photoURL ??
            'https://firebasestorage.googleapis.com/v0/b/social-app-82077.appspot.com/o/assets%2Fimages%2Fdefault_profile_image.png?alt=media&token=03a7af20-ced7-49e4-8882-6127d37d1250',
        name: userCredential.user!.displayName ?? 'Hunter',
        phone: userCredential.user!.phoneNumber ?? '01122524270',
        profileCover:
            'https://img.freepik.com/free-vector/mountains-desert-dunes-landscape_23-2148271245.jpg?w=740&t=st=1658964364~exp=1658964964~hmac=7f0e00e1e2516d8f9f51860152d09474627a0451e6b57ea2f7ed43f5b6c87cdb',
        bio: 'hi,welcome there...',
      );

  Map<String, dynamic> toJson() => {
        'profileCover': profileCover,
        'image': photo,
        'name': name,
        'bio': bio,
        'email': email,
        'phone': phone,
      };
}
