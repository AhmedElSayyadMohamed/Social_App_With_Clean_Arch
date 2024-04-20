import 'package:flutter/material.dart';
import 'package:social_app/feature/feeds/presentation/bussiness_logic/feeds_bloc.dart';

import '../../../../../../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import '../../../../../../utils/strings_manager/strings_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var Bloc = FeedsBloc.get(context);

    return AppBar(
      leading: const BackButton(),
      title: const Text(StringsManager.addPost),
      actions: [
        CustomTextButton(
          onTap: () {
            Bloc.add(CreatePostWithImageEvent(Bloc.postController.text));
          },
          buttonLabel: StringsManager.post,
          textColor: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
