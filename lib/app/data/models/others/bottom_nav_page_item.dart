import 'package:flutter/material.dart';

class BottomNavPageItem {
  String title;
  Icon icon;
  Icon activeIcon;
  Widget page;

  BottomNavPageItem({
    required this.title,
    required this.icon,
    required this.activeIcon,
    required this.page,
  });
}
