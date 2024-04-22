import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';
import 'package:social_app/feature/feeds/domain/use_cases/base_feeds_use_cases.dart';
import 'package:social_app/feature/feeds/domain/use_cases/get_my_posts_by_id_usecase.dart';
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
  final GetMyPostsByIdUseCase getMyPostsByIdUseCase;

  FeedsBloc(
    this.uploadImageToFireStorageUseCase,
    this.createPostWithImageUseCase,
    this.getMyPostsByIdUseCase,
  ) : super(FeedsInitial()) {
    on<PickPostImageFromGalleryEvent>(_pickImageFromGallery);
    on<CreatePostWithImageEvent>(_createPostWithImage);
    on<GetMyPostsByIdEvent>(_getMyPostsByUid);
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

    return status.isGranted ? true : false;
  }

  void closeSelectedImage() {
    imageFile = '';
    emit(CloseImageState());
  }

  FutureOr<void> _createPostWithImage(
    CreatePostWithImageEvent event,
    Emitter<FeedsStates> emit,
  ) async {
    emit(CreatePostWithImageLoadingState());
    await _uploadPostImageToFireStorage().then((imageUrl) async {
      final result = await createPostWithImageUseCase(
        Post(
          uId: currentUserId,
          date: DateTime.now().toString(),
          image: imageUrl,
          containText: event.text,
          comments: const [],
          likes: const [],
          tags: const [],
        ),
      );
      result.fold(
        (l) {
          emit(CreatePostWithImageErrorState());
        },
        (r) {
          emit(CreatePostWithImageSuccessState());
        },
      );
    });
  }

  Future<String> _uploadPostImageToFireStorage() async {
    late String imageUrl;
    emit(UploadPostImageLoadingState());

    final result =
        await uploadImageToFireStorageUseCase(Parameters(imageFile: imageFile));
    result.fold((l) {
      emit(UploadPostImageErrorState(l.msg));
    }, (image) {
      imageUrl = image;
      emit(UploadPostImageSuccessState(imageUrl: imageUrl));
    });
    return imageUrl;
  }

  FutureOr<void> _getMyPostsByUid(
      GetMyPostsByIdEvent event,
    Emitter<FeedsStates> emit,
  ) async {
    emit(GetMyPostsByUidLoadingState());

    final result = await getMyPostsByIdUseCase(Parameters(uId: event.uId));
    result.fold(
          (l) {
        emit(GetMyPostsByUidErrorState(l.msg));
      },
          (posts) {
        emit(GetMyPostsByUidSuccessState(posts));
      },
    );
  }
}
