part of 'feeds_bloc.dart';

abstract class FeedsEvent {}
class PickPostImageFromGalleryEvent extends FeedsEvent{}

class AddPostEvent extends FeedsEvent{
  final String text;
  AddPostEvent(this.text);
}
class GetMyPostsByIdEvent extends FeedsEvent{
  final String uId;
  GetMyPostsByIdEvent(this.uId);
}

class ToggleLikePostAndGetPostLikesEvent extends FeedsEvent{
  final String postId;

  ToggleLikePostAndGetPostLikesEvent({required this.postId});
}