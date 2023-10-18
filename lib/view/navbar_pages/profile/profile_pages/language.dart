import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:provider/provider.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.selectProfileIndex(0);
                },
                child: CircleAvatar(
                  backgroundColor: LightTheme.secondarybackgroundTheme,
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    color: LightTheme.mainTheme,
                  ),
                ),
              )
            ],
          ),
          20.verticalSpace,
          Text(
            'Choose a Language',
            style: TextStyle(
                fontSize: 20.sp,
                color: LightTheme.fontTheme,
                fontWeight: FontWeight.bold),
          ),
          10.verticalSpace,
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.selectLanguage(0);
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: (controller.languageIndex == 0)
                        ? LightTheme.mainTheme
                        : LightTheme.backgroundTheme,
                  ),
                  child: Center(
                    child: Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: LightTheme.secondarybackgroundTheme,
                      ),
                      child: Center(
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: (controller.languageIndex == 0)
                                ? LightTheme.mainTheme
                                : LightTheme.secondarybackgroundTheme,
                          ),
                          child: Center(
                            child: Text(
                              'ENG',
                              style: TextStyle(
                                  color: LightTheme.fontTheme,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
              GestureDetector(
                onTap: () {
                  controller.selectLanguage(1);
                },
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: (controller.languageIndex == 1)
                        ? LightTheme.mainTheme
                        : LightTheme.backgroundTheme,
                  ),
                  child: Center(
                    child: Container(
                      width: 35.w,
                      height: 35.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: LightTheme.secondarybackgroundTheme,
                      ),
                      child: Center(
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: (controller.languageIndex == 1)
                                ? LightTheme.mainTheme
                                : LightTheme.secondarybackgroundTheme,
                          ),
                          child: Center(
                            child: Text(
                              'AR',
                              style: TextStyle(
                                  color: LightTheme.fontTheme,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
            ],
          ),
        ],
      );
    });
  }
}
