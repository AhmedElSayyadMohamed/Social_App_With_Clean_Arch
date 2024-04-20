part of 'feeds_bloc.dart';

abstract class FeedsEvent {}
class PickPostImageFromGalleryEvent extends FeedsEvent{}
class UploadPostImageToFireStorageEvent extends FeedsEvent{}

class CreatePostWithImageEvent extends FeedsEvent{
  final String text;
  CreatePostWithImageEvent(this.text);
}
class CreatePostWithoutImageEvent extends FeedsEvent{
  final String text;
  CreatePostWithoutImageEvent(this.text);
}