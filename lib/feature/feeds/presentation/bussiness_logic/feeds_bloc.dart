import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:social_app/feature/feeds/domain/entities/post.dart';
import 'package:social_app/feature/feeds/domain/use_cases/base_feeds_use_cases.dart';
import 'package:social_app/feature/feeds/domain/use_cases/get_my_posts_by_id_usecase.dart';
import 'package:social_app/feature/feeds/domain/use_cases/toggle_like_post_usecase.dart';
import '../../../../core/constants.dart';
import '../../domain/use_cases/add_post_usecase.dart';

part 'feeds_event.dart';
part 'feeds_state.dart';

class FeedsBloc extends Bloc<FeedsEvent, FeedsStates> {
  static FeedsBloc get(context) => BlocProvider.of(context);

  String imageFile = '';
  final postController = TextEditingController();
  /////////////////////////////////////////////////////////////////////

  final AddPostUseCase addPostUseCase;
  final GetMyPostsByIdUseCase getMyPostsByIdUseCase;
  final ToggleLikePostAndGetPostLikesUseCase toggleLikePostAndGetPostLikesUseCase;

  FeedsBloc(
    this.addPostUseCase,
    this.getMyPostsByIdUseCase,
    this.toggleLikePostAndGetPostLikesUseCase,
  ) : super(FeedsInitial()) {
    on<AddPostEvent>(_addPost);
    on<GetMyPostsByIdEvent>(_getMyPostsByUid);
    on<PickPostImageFromGalleryEvent>(_pickImageFromGallery);
    on<ToggleLikePostAndGetPostLikesEvent>(_toggleLikePost);

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
      emit(
          PickImagePermissionDeniedState(
          'Permission denied to access photo gallery.',
      ),
      );
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

  FutureOr<void> _addPost(
    AddPostEvent event,
    Emitter<FeedsStates> emit,
  ) async {
    emit(AddPostLoadingState());
    final result = await addPostUseCase(
      Post(
        uId: currentUserId,
        date: DateTime.now().toString(),
        image: imageFile,
        containText: event.text,
        tags: const [],
      ),
    );
    result.fold(
      (l) {
        emit(AddPostErrorState());
      },
      (r) {
        emit(AddPostSuccessState());
      },
    );
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

  FutureOr<void> _toggleLikePost(
   ToggleLikePostAndGetPostLikesEvent event,
    Emitter<FeedsStates> emit,
  ) async {
    final result = await toggleLikePostAndGetPostLikesUseCase(Parameters(postId: event.postId),);
    result.fold(
      (l) => emit(ToggleLikePostErrorState(l.msg)),
      (r) =>emit(ToggleLikePostSuccessState(r)),
    );
  }
}
