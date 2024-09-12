import 'package:flutter/material.dart';
import 'package:pindap_todolist/app/data/models/others/task_group_item.dart';
import 'package:pindap_todolist/utils/app_typography.dart';
import 'package:pindap_todolist/utils/constants.dart';

class DropdownItem extends StatelessWidget {
  const DropdownItem({
    super.key,
    required this.item,
  });

  final TaskGroupItem item;

  @override
  Widget build(final BuildContext context) => Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(Constants.baseCardRadius),
            ),
            child: Icon(
              item.icon,
              color: item.color,
              size: 16,
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            item.title,
            style: AppTypography.paragraph3,
          ),
        ],
      );
}
