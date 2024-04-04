import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/app_size/app_size.dart';
part 'social_event.dart';
part 'social_state.dart';

class SocialBloc extends Bloc<SocialEvent, SocialStates> {
  static SocialBloc get(context) => BlocProvider.of(context);

  SocialBloc() : super(SocialInitial()) {
    on<ToggleNavBarIndexEvent>(_toggleNavBarIndex);
  }

  int navBarIndex = 0;

  double selectedIconSize(int index) =>
      index == navBarIndex ? AppSize.s3_5: AppSize.s2_5;

  Color? selectedIconColor(int index) =>
      index == navBarIndex ? Colors.amber : Colors.grey[300];

  FutureOr<void> _toggleNavBarIndex(
    ToggleNavBarIndexEvent event,
    Emitter<SocialStates> emit,
  ) {
    navBarIndex = event.index;
    emit(ToggleNavBarIndexState());
  }


}
