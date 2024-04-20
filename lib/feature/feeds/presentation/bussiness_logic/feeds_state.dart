part of 'feeds_bloc.dart';


abstract class FeedsStates {}

final class FeedsInitial extends FeedsStates {}
class PostsInitial extends FeedsStates {}

class CreatePostWithImageLoadingState extends FeedsStates {}
class CreatePostWithImageSuccessState extends FeedsStates {}
class CreatePostWithImageErrorState extends FeedsStates {}

class UploadPostImageLoadingState extends FeedsStates {}
class UploadPostImageSuccessState extends FeedsStates {
  final String? imageUrl;
  get getImageUrl => imageUrl;
  UploadPostImageSuccessState({this.imageUrl});
}
class UploadPostImageErrorState extends FeedsStates {
  final String msg;
  UploadPostImageErrorState(this.msg);
}

class CreatePostWithoutImageLoadingState extends FeedsStates {}
class CreatePostWithoutImageSuccessState extends FeedsStates {}
class CreatePostWithoutImageErrorState extends FeedsStates {}

class PickImageLoadingState extends FeedsStates {}
class PickImageSuccessState extends FeedsStates {}
class PickImageErrorState extends FeedsStates {
final String errorMsg;

PickImageErrorState(this.errorMsg);
}
class PickImagePermissionDeniedState extends FeedsStates {
final String msg;

PickImagePermissionDeniedState(this.msg);
}
class CloseImageState extends FeedsStates {}

