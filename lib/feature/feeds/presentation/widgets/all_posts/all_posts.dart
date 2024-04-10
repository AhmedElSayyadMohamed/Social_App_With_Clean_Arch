import 'package:flutter/material.dart';
import '../post_item.dart';

class AllPosts extends StatelessWidget {
  const AllPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => const PostWidget(),
      itemCount: 8,
    );
  }
}
