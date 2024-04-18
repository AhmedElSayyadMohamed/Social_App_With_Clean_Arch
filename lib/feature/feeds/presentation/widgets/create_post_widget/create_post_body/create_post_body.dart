import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bussiness_logic/feeds_bloc.dart';

class CreatePostScreenBody extends StatelessWidget {
  CreatePostScreenBody({super.key});
  final postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: postController,
              keyboardType: TextInputType.text,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "What is in your mind ?",
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.grey),
                border: InputBorder.none,
              ),
            ),
            BlocBuilder<FeedsBloc, FeedsStates>(
              builder: (context, state) {
                var bloc = FeedsBloc.get(context);
                return Visibility(
                  visible: bloc.imageFile != '',
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 350,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.file(
                          File(bloc.imageFile),
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          bloc.closeImage();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.redAccent,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
