// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/my_nav_bar/navbar.dart';
import 'package:krispy_store/view/navbar_pages/cart/cart.dart';
import 'package:krispy_store/view/navbar_pages/favorites/favorites.dart';
import 'package:krispy_store/view/navbar_pages/home/home_screen.dart';
import 'package:krispy_store/view/navbar_pages/notifications/notifications.dart';
import 'package:krispy_store/view/navbar_pages/profile/profile_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> myPages = [
      const HomeScreen(),
      const Cart(),
      const Favorites(),
      const Notifications(),
      const ProfileScreen()
    ];
    return Consumer<StateController>(builder: (context, controller, child) {
      return SafeArea(
        child: Scaffold(
          extendBody: true,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            child:
                // myPages[context.watch<StateController>().selectedpageIndex],
                PageView(
              controller: controller.pgCtrl,
              children: myPages,
              onPageChanged: (index) {
                controller.selectPage(index);
              },
            ),
          ),
          backgroundColor: LightTheme.backgroundTheme,
          bottomNavigationBar: const MyNavBar(),
        ),
      );
    });
  }
}
