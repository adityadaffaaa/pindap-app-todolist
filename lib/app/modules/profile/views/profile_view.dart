import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pindap_todolist/app/modules/profile/controllers/profile_controller.dart';
import 'package:pindap_todolist/app/modules/profile/views/sections/body_section.dart';
import 'package:pindap_todolist/app/modules/profile/views/sections/head_section.dart';
import 'package:pindap_todolist/utils/constants.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding:
            const EdgeInsets.symmetric(vertical: Constants.baseGapPerSection),
        child: ListView(
          children: const <Widget>[
            HeadSection(),
            BodySection(),
          ],
        ),
      );
}
