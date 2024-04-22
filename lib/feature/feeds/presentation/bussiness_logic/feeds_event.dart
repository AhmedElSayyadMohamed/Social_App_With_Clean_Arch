part of 'feeds_bloc.dart';

abstract class FeedsEvent {}
class PickPostImageFromGalleryEvent extends FeedsEvent{}

class CreatePostWithImageEvent extends FeedsEvent{
  final String text;
  CreatePostWithImageEvent(this.text);
}
class GetMyPostsByIdEvent extends FeedsEvent{
  final String uId;
  GetMyPostsByIdEvent(this.uId);
}

class CreatePostWithoutImageEvent extends FeedsEvent{
  final String text;
  CreatePostWithoutImageEvent(this.text);
}