import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/my_nav_bar/navbar_item.dart';
import 'package:provider/provider.dart';

class MyNavBar extends StatelessWidget {
  const MyNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 25.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.w, sigmaY: 3.h),
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                  // backgroundBlendMode: BlendMode.luminosity,
                  color: LightTheme.secondarybackgroundTheme.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(35.r)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyNavItem(
                    myIcon: Icons.home_filled,
                    myIndex: 0,
                  ),
                  MyNavItem(
                    myIcon: Icons.shopping_cart,
                    myIndex: 1,
                  ),
                  MyNavItem(
                    myIcon: Icons.favorite,
                    myIndex: 2,
                  ),
                  MyNavItem(
                    myIcon: Icons.notifications,
                    myIndex: 3,
                  ),
                  MyNavItem(
                    myIcon: Icons.settings,
                    myIndex: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
