import 'package:flutter/material.dart';

class TaskGroupItem {
  final int type;
  final String title;
  final IconData icon;
  final Color color;

  TaskGroupItem({
    required this.type,
    required this.title,
    required this.icon,
    required this.color,
  });
}
