import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/view/navbar_pages/components/title.dart';
import 'package:krispy_store/view/navbar_pages/profile/components/settings_list.dart';
import 'package:krispy_store/view/navbar_pages/profile/components/view.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MainTitle(title: 'Settings'),
          30.verticalSpace,
          const ProfileView(),
          30.verticalSpace,
          const SettingsList(),
        ],
      ),
    );
  }
}
