part of 'social_bloc.dart';

abstract class SocialEvent {}

class ToggleNavBarIndexEvent extends SocialEvent{
  final int index;

  ToggleNavBarIndexEvent(this.index);
}