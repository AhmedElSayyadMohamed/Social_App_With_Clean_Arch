import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/feature/feeds/presentation/bussiness_logic/feeds_bloc.dart';
import '../../../../../../core/icon_broken/icon_broken.dart';
import '../../../../../../utils/strings_manager/strings_manager.dart';

class PickImageAndAddTags extends StatelessWidget {
  const PickImageAndAddTags({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedsBloc, FeedsStates>(
      builder: (context, state) {
        var bloc = FeedsBloc.get(context);
        return Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => bloc.add(PickPostImageFromGalleryEvent()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      IconBroken.Image,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      StringsManager.addImage,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: Text(
                  StringsManager.addTags,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
