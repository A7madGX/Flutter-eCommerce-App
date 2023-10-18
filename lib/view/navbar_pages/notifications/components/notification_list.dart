import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/notifications/components/notification_item.dart';
import 'package:provider/provider.dart';

class NotiList extends StatelessWidget {
  const NotiList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return Container(
        clipBehavior: Clip.hardEdge,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: LightTheme.thirdbackgroundTheme,
            borderRadius: BorderRadius.circular(40.r)),
        width: double.infinity,
        height: 420.h,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...controller.notifications
                  .map((notification) => NotiItem(myNoti: notification))
              // NotiItem(),
              // NotiItem(),
              // NotiItem(),
              // NotiItem(),
              // NotiItem(),
              // NotiItem(),
              // NotiItem(),
              // NotiItem(),
              // NotiItem(),
              // NotiItem(),
            ],
          ),
        ),
      );
    });
  }
}
