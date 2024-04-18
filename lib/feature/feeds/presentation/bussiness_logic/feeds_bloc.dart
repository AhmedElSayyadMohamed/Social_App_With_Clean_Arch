import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

part 'feeds_event.dart';
part 'feeds_state.dart';

class FeedsBloc extends Bloc<FeedsEvent, FeedsStates> {
  static FeedsBloc get(context) => BlocProvider.of(context);
  String imageFile ='';

  FeedsBloc() : super(FeedsInitial()) {
    on<PickPostImageFromGalleryEvent>(_pickImageFromGallery);
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

    if(await requestPermissionForPickImage){
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        imageFile = pickedFile.path;
        emit(PickImageSuccessState());
      } else {
        emit(PickImageErrorState('No image selected'));
      }
    }else{
      emit(PickImagePermissionDeniedState('Permission denied to access photo gallery.'));
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

  closeImage(){
    imageFile ='';
    emit(CloseImageState());
  }



  FutureOr<void> _createPostWithImage(
      CreatePostWithImageEvent event,
      Emitter<FeedsStates> emit,
      ) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    emit(CreatePostWithImageLoadingState());

    Reference ref = storage.ref().child('users/${DateTime.now()}.jpg');
    UploadTask uploadTask = ref.putFile(File(imageFile));

    await uploadTask.then((image) {

      print('Image uploaded successfully');
    }).catchError((error){
      print('Error uploading image: $error');
    });
  }
}
