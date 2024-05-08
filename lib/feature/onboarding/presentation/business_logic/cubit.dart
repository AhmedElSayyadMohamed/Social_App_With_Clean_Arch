import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(InitialOnBoardingState());
  static OnBoardingCubit get(context) => BlocProvider.of(context);

  ////////////////////////////////////////////////////////////////////////
  final PageController pageController = PageController();
  int numberOfOnBoardingPages = 3;
  int currentPageViewIndex = 0;

  changecurrentPageViewIndex(int index) {
    currentPageViewIndex = index;
    emit(ChangeCurrentPageViewIndexState());
  }
}
