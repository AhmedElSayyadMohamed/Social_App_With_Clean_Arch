import 'package:flutter/material.dart';
import 'package:social_app/core/extension/responsive_context.dart';

import '../../../../../utils/app_size/app_size.dart';

class BuildInteractionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  const BuildInteractionButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.label,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsetsDirectional.all(5),
        width: context.widthPercent(AppSize.s2_5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.indigo,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
