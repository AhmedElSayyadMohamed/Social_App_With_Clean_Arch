import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bussiness_logic/feeds_bloc.dart';


class AllPosts extends StatelessWidget {
  const AllPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedsBloc, FeedsStates>(
      builder: (context, state) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(),
          itemCount: 8,
        );
      },
    );
  }
}
