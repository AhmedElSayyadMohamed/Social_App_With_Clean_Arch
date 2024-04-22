
import 'package:social_app/feature/profile/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uId,
    required super.photo,
    required super.name,
    required super.phone,
    required super.email,
    required super.profileCover,
    required super.bio,
    required super.followers,
    required super.following,
  });

  factory UserModel.fromJson(user) => UserModel(
        uId: user['uid'],
        email: user['email'],
        photo: user['image'],
        name:user['name'],
        phone:  user['phone'],
        profileCover:user['profileCover'],
        bio: user['bio'],
        followers: user['followers'],
        following: user ['following'],
      );

  Map<String, dynamic> toJson() => {
        'uid':uId,
        'profileCover': profileCover,
        'image': photo,
        'name': name,
        'bio': bio,
        'email': email,
        'phone': phone,
      };
}
