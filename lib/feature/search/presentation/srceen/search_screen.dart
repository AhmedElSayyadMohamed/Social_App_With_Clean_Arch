import 'package:flutter/material.dart';
import 'package:social_app/core/icon_broken/icon_broken.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  final TextEditingController searchController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SearchBar(
          // padding: EdgeInsetsDirectional.all(01),
          controller:searchController,
          leading:const Icon(IconBroken.search),
          hintText: 'Search For a User ........',
        )
      ],
    );
  }
}
