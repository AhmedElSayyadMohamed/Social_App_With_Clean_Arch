part of 'feeds_bloc.dart';

abstract class FeedsEvent {}
class PickPostImageFromGalleryEvent extends FeedsEvent{}
class CreatePostWithImageEvent extends FeedsEvent{
  final String text;
  final String postImage;

  CreatePostWithImageEvent(this.text, this.postImage);
}
class CreatePostWithoutImageEvent extends FeedsEvent{
  final String text;
  CreatePostWithoutImageEvent(this.text);
}