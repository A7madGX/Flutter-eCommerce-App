import 'package:flutter/material.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/profile/profile_pages/Theme.dart';
import 'package:krispy_store/view/navbar_pages/profile/profile_pages/language.dart';
import 'package:krispy_store/view/navbar_pages/profile/profile_pages/personal_info.dart';
import 'package:krispy_store/view/navbar_pages/profile/profile_pages/profile.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> profilePages = [
      const Profile(),
      const PersonalInfo(),
      const LanguagePage(),
      const ThemePage(),
      const Profile(),
      const Profile(),
      const Profile(),
    ];
    return Consumer<StateController>(builder: (context, controller, child) {
      return profilePages[controller.profilepageIndex];
    });
  }
}
