import 'package:flutter/material.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.badge,
  });

  final String title;
  final int? badge;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: Constants.basePadding),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: AppTypography.paragraph1,
            ),
            const SizedBox(
              width: 6,
            ),
            badge != null
                ? CircleAvatar(
                    radius: Constants.baseCardRadius,
                    child: Text('${badge!}'),
                  )
                : const SizedBox(),
          ],
        ),
      );
}
