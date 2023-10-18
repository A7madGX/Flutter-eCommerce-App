import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/classes/utils/category.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:provider/provider.dart';

class MyCategories extends StatelessWidget {
  const MyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final double myHeight = 140.h;
    final double myWidth = 100.w;
    return Consumer<StateController>(builder: (context, controller, child) {
      return Container(
        decoration: BoxDecoration(
            color: LightTheme.backgroundTheme,
            borderRadius: BorderRadius.circular(15.r)),
        width: 1.sw,
        height: 330.h,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          mainAxisSpacing: 25.h,
          crossAxisSpacing: 25.w,
          crossAxisCount: 2,
          childAspectRatio: myHeight / myWidth,
          children: [
            GestureDetector(
              onTap: () {
                controller.setCategory(MyCategoryType.phones);
                controller.selectHomePage(1);
              },
              child: Stack(clipBehavior: Clip.none, children: [
                AnimatedContainer(
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(3.w, 3.h),
                            blurRadius: 5.r,
                            color: LightTheme.darkgreyTheme.withOpacity(0.7))
                      ],
                      color: LightTheme.mainTheme,
                      borderRadius: BorderRadius.circular(15.r)),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      'Smartphones',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Positioned(
                  top: -20.h,
                  right: -20.w,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(20 / 360),
                    child: SvgPicture.asset(
                      'assets/images/smartphone_cartoon.svg',
                      width: 60.w,
                    ),
                  ),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                controller.setCategory(MyCategoryType.laptops);
                controller.selectHomePage(1);
              },
              child: Stack(clipBehavior: Clip.none, children: [
                AnimatedContainer(
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(3.w, 3.h),
                            blurRadius: 5.r,
                            color: LightTheme.darkgreyTheme.withOpacity(0.7))
                      ],
                      color: LightTheme.mainTheme,
                      borderRadius: BorderRadius.circular(15.r)),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      'Laptops',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Positioned(
                  top: -20.h,
                  right: -20.w,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(20 / 360),
                    child: SvgPicture.asset(
                      'assets/images/laptop_cartoon.svg',
                      width: 65.w,
                    ),
                  ),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                controller.setCategory(MyCategoryType.fragrance);
                controller.selectHomePage(1);
              },
              child: Stack(clipBehavior: Clip.none, children: [
                AnimatedContainer(
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(3.w, 3.h),
                            blurRadius: 5.r,
                            color: LightTheme.darkgreyTheme.withOpacity(0.7))
                      ],
                      color: LightTheme.mainTheme,
                      borderRadius: BorderRadius.circular(15.r)),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      'Fragrances',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Positioned(
                  top: -25.h,
                  right: -25.w,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(15 / 360),
                    child: SvgPicture.asset(
                      'assets/images/perfume.svg',
                      width: 70.w,
                    ),
                  ),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                controller.setCategory(MyCategoryType.skincare);
                controller.selectHomePage(1);
              },
              child: Stack(clipBehavior: Clip.none, children: [
                AnimatedContainer(
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(3.w, 3.h),
                            blurRadius: 5.r,
                            color: LightTheme.darkgreyTheme.withOpacity(0.7))
                      ],
                      color: LightTheme.mainTheme,
                      borderRadius: BorderRadius.circular(15.r)),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      'Skincare',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Positioned(
                  top: -20.h,
                  right: -20.w,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(20 / 360),
                    child: SvgPicture.asset(
                      'assets/images/skincare.svg',
                      width: 70.w,
                    ),
                  ),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                controller.setCategory(MyCategoryType.groceries);
                controller.selectHomePage(1);
              },
              child: Stack(clipBehavior: Clip.none, children: [
                AnimatedContainer(
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(3.w, 3.h),
                            blurRadius: 5.r,
                            color: LightTheme.darkgreyTheme.withOpacity(0.7))
                      ],
                      color: LightTheme.mainTheme,
                      borderRadius: BorderRadius.circular(15.r)),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      'Groceries',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Positioned(
                  top: -10.h,
                  right: -10.w,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(20 / 360),
                    child: SvgPicture.asset(
                      'assets/images/groceries.svg',
                      width: 40.w,
                    ),
                  ),
                ),
              ]),
            ),
            GestureDetector(
              onTap: () {
                controller.setCategory(MyCategoryType.homeDecoration);
                controller.selectHomePage(1);
              },
              child: Stack(clipBehavior: Clip.none, children: [
                AnimatedContainer(
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
                  duration: const Duration(milliseconds: 500),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(3.w, 3.h),
                            blurRadius: 5.r,
                            color: LightTheme.darkgreyTheme.withOpacity(0.7))
                      ],
                      color: LightTheme.mainTheme,
                      borderRadius: BorderRadius.circular(15.r)),
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text(
                      'Decorations',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Positioned(
                  top: -25.h,
                  right: -25.w,
                  child: RotationTransition(
                    turns: const AlwaysStoppedAnimation(20 / 360),
                    child: SvgPicture.asset(
                      'assets/images/plant.svg',
                      width: 70.w,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      );
    });
  }
}
