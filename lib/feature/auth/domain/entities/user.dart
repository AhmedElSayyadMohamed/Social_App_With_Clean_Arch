import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uId;
  final String photo;
  final String name;
  final String phone;
  final String email;

  const UserEntity({
   required this.uId,
   required this.photo,
   required this.name,
   required this.phone,
   required this.email,
  });

  @override
  List<Object> get props => [
        uId,
        photo,
        name,
    phone,
        email,
      ];
}
