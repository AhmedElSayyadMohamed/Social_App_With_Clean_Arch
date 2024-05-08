import 'package:flutter/material.dart';
import '../../../../../../core/basics_shared_widgets/custom_text_button/custom_text_button.dart';
import '../../../../../../utils/strings_manager/strings_manager.dart';
import '../../../bussiness_logic/feeds_bloc.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = FeedsBloc.get(context);

    return AppBar(
      leading: const BackButton(),
      title: const Text(StringsManager.addPost),
      actions: [
        CustomTextButton(
          onTap: () {
            bloc.add(AddPostEvent(bloc.postController.text));
          },
          buttonLabel: StringsManager.post,
          textColor: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
