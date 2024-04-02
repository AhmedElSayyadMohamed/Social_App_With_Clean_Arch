import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/auth/presentation/business_logic/register_bloc/register_states.dart';

import '../../../data/models/user_model.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isSecure = true;

  void securityOfPassword() {
    isSecure = !isSecure;
    emit(PasswordSecurityState());
  }

  FirebaseAuth? firebaseAuth = FirebaseAuth.instance;

  Future userRegister({
    required userName,
    required email,
    required phone,
    required password,
    required confirmPassword,
    required BuildContext context,
  }) async {

    emit(RegisterLoadingState());
    if (password == confirmPassword) {
      firebaseAuth?.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ).then((value) {

        // GeneralCubit.get(context).getUser();
        // GeneralCubit.get(context).getPost();
        createUser(
          userName: userName,
          email: email,
          phone: phone,
          uid: firebaseAuth!.currentUser!.uid,
        );
        print("new user came");
        emit(RegisterSuccessState(firebaseAuth!.currentUser!.uid));
      }).catchError((error) {
        print("error when create account ${error.toString()}");
        emit(RegisterErrorState(error.toString()));
      });
    } else {
      emit(RegisterErrorState(
          "Passwords is not the same please check your password "));
    }
  }

  void createUser({
    required userName,
    required email,
    required phone,
    required String uid,
  }) async {
    var profileImage = "assets/images/default_profile_image.png";
    ByteData bytes = await rootBundle.load(profileImage);
    Uint8List rawData =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    UserModel model;
    FirebaseStorage.instance
        .ref(profileImage)
        .putData(rawData)
        .then((p0) async {
      // model = UserModel(
      //   name: userName,
      //   email: email,
      //   phone: phone,
      //   uid: uid,
      //   image: await p0.ref.getDownloadURL(),
      //   bio: 'hi, welcome there...',
      //   profileCover:
      //       'https://img.freepik.com/free-photo/breathtaking-view-tree-field-with-tree-line-background-beautiful-sky_181624-18119.jpg?w=740&t=st=1658959520~exp=1658960120~hmac=35fe5c900d2909b23b8b643267540a23b1b92f3f6f8e6f8cdaf84f15704f82b7',
      // );
      // FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(uid)
      //     .set(model.t)
      //     .then((value) {})
      //     .catchError((error) {
      //   print("error when create user in cloud fire store ${error.toString()}");
      // });
    }).catchError((error) {
      print(
          "error when upload default_profile_image to firestorage${error.toString()}");
    });
  }
}
//'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png',
              