import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/feature/auth/domain/entities/user.dart';

class UserModel extends UserEntity {

  const UserModel({
    required super.uId,
    required super.photo,
    required super.name,
    required super.phone,
    required super.email,
  });

  factory UserModel.fromJson(UserCredential userCredential) => UserModel(
          uId: userCredential.user!.uid,
          email:userCredential.user!.email??'example@example.com',
          photo: userCredential.user!.photoURL??'',
          name: userCredential.user!.displayName??'Hunter',
          phone: userCredential.user!.phoneNumber??'01122524270',
      );
}
