import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/view/navbar_pages/profile/components/settings_item.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(color: LightTheme.backgroundTheme),
      width: double.infinity,
      height: 325.h,
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SettingsItem(
              myIcon: Icons.person,
              name: 'Personal Info',
              index: 1,
            ),
            SettingsItem(
              myIcon: Icons.language,
              name: 'Language',
              index: 2,
            ),
            SettingsItem(
              myIcon: Icons.mode,
              name: 'Theme',
              index: 3,
            ),
            SettingsItem(
              myIcon: Icons.help,
              name: 'Help',
              index: 4,
            ),
            SettingsItem(
              myIcon: Icons.contact_support,
              name: 'Contact Us',
              index: 5,
            ),
            SettingsItem(
              myIcon: Icons.logout,
              name: 'Logout',
              index: 6,
            ),
          ],
        ),
      ),
    );
  }
}
