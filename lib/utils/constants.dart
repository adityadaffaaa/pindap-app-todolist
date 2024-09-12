import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:pindap_todolist/utils/app_colors.dart';
import 'package:pindap_todolist/utils/type.dart';

class Constants {
// Helper variable
  static const double basePadding = 24;
  static const double baseCardRadius = 12;
  static const double baseRadius = 24;
  static const double baseGapPerSection = 32;
  static const double baseGap = 24;
  static const double infinite = 9999;

// Ui helper
  static const EdgeInsets contentPadding = EdgeInsets.symmetric(
    horizontal: 10.0,
    vertical: 18,
  );

// For task api
  static const String API_BASE_URL =
      'https://65d32772522627d50108210f.mockapi.io/';

// Data
  static const List<JSON> settingMenus = <JSON>[
    <String, dynamic>{
      'title': 'Account',
      'icon': IconlyLight.arrow_right_2,
    },
    <String, dynamic>{
      'title': 'Language',
      'icon': IconlyLight.arrow_right_2,
    },
    <String, dynamic>{
      'title': 'Security',
      'icon': IconlyLight.arrow_right_2,
    },
    <String, dynamic>{
      'title': 'FAQ',
      'icon': IconlyLight.login,
    },
    <String, dynamic>{
      'title': 'Terms Of Service',
      'icon': IconlyLight.login,
    },
    <String, dynamic>{
      'title': 'Privacy Policy',
      'icon': IconlyLight.login,
    },
  ];

  static const List<JSON> taskGroup = <JSON>[
    <String, dynamic>{
      'type': 1,
      'title': 'Office Project',
      'icon': IconsaxPlusBold.briefcase,
      'color': AppColors.officeProjectColor,
    },
    <String, dynamic>{
      'type': 2,
      'title': 'Personal Project',
      'icon': IconsaxPlusBold.user_octagon,
      'color': AppColors.personalProjectColor,
    },
    <String, dynamic>{
      'type': 3,
      'title': 'Daily Study',
      'icon': IconsaxPlusBold.book_1,
      'color': AppColors.dailyStudyColor,
    },
  ];

  static const List<JSON> taskStatus = <JSON>[
    <String, dynamic>{
      'type': 1,
      'title': 'To do',
    },
    <String, dynamic>{
      'type': 2,
      'title': 'In Progress',
    },
    <String, dynamic>{
      'type': 3,
      'title': 'Done',
    },
  ];
}
