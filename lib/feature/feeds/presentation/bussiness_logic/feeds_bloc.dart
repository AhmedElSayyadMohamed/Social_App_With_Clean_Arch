import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:social_app/core/network/failure/failure.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';
import 'package:social_app/feature/feeds/domain/use_cases/base_feeds_use_cases.dart';
import 'package:social_app/feature/feeds/domain/use_cases/upload_post_image_to_fie_stroage.dart';

import '../../../../core/constants.dart';
import '../../domain/use_cases/create_post_with_image.dart';

part 'feeds_event.dart';
part 'feeds_state.dart';

class FeedsBloc extends Bloc<FeedsEvent, FeedsStates> {
  static FeedsBloc get(context) => BlocProvider.of(context);

  String imageFile = '';
  final postController = TextEditingController();
  /////////////////////////////////////////////////////////////////////

  final UploadImageToFireStorageUseCase uploadImageToFireStorageUseCase;
  final CreatePostWithImageUseCase createPostWithImageUseCase;


  FeedsBloc(
      this.uploadImageToFireStorageUseCase,
      this.createPostWithImageUseCase,
      )
      : super(FeedsInitial()) {
    on<PickPostImageFromGalleryEvent>(_pickImageFromGallery);
    on<UploadPostImageToFireStorageEvent>(_uploadPostImageToFireStorage);
    on<CreatePostWithImageEvent>(_createPostWithImage);
    on<CreatePostWithoutImageEvent>(_createPost);
  }

  FutureOr<void> _createPost(
    CreatePostWithoutImageEvent event,
    Emitter<FeedsStates> emit,
  ) {
    // PostModel model = PostModel();
    // FirebaseFirestore.instance
    //     .collection('UsersPosts')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .collection('MyPosts')
    //     .add(model)
    //     .then((value) {
    //
    // }).catchError((error){
    //
    // });
  }

  FutureOr<void> _pickImageFromGallery(
    PickPostImageFromGalleryEvent event,
    Emitter<FeedsStates> emit,
  ) async {
    final picker = ImagePicker();
    emit(PickImageLoadingState());

    if (await requestPermissionForPickImage) {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imageFile = pickedFile.path;
        emit(PickImageSuccessState());
      } else {
        emit(PickImageErrorState('No image selected'));
      }
    } else {
      emit(PickImagePermissionDeniedState(
          'Permission denied to access photo gallery.'));
    }
  }

  Future<bool> get requestPermissionForPickImage async {
    var status = await Permission.storage.request();
    print('status is $status');
    if (status.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  void closeImage() {
    imageFile = '';
    emit(CloseImageState());
  }

  FutureOr<void> _createPostWithImage(
    CreatePostWithImageEvent event,
    Emitter<FeedsStates> emit,
  ) async {
    emit(CreatePostWithImageLoadingState());
    add(UploadPostImageToFireStorageEvent());
    if (FeedsStates is UploadPostImageSuccessState) {
      final result = await createPostWithImageUseCase(
        Post(
          uId: currentUserId,
          date: DateTime.now().toString(),
          image: UploadPostImageSuccessState().getImageUrl,
          containText: event.text,
          comments: const [],
          likes: const [],
          tags: const [],
        ),
      );
      result.fold(
        (l) {
          print(l.msg);
          emit(CreatePostWithImageErrorState());
        },
        (r) {
          print(r);
          emit(CreatePostWithImageSuccessState());
        },
      );
    }
  }

  FutureOr<void> _uploadPostImageToFireStorage(
    UploadPostImageToFireStorageEvent event,
    Emitter<FeedsStates> emit,
  ) async {
    emit(UploadPostImageLoadingState());
    final result = await uploadImageToFireStorageUseCase(Parameters(imageFile));
    result.fold((l) {
      emit(UploadPostImageErrorState(l.msg));
      throw ServerErrorException(msg: l.msg);
    }, (imageUrl) {
      emit(UploadPostImageSuccessState(imageUrl: imageUrl));
    });
  }
}
