import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/components/title.dart';
import 'package:krispy_store/view/navbar_pages/notifications/components/notification_list.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const MainTitle(title: 'Notifications'),
            10.verticalSpace,
            Row(
              children: [
                Text(
                  'You have ${controller.notifications.length} notifications',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: LightTheme.secondaryfontTheme,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            5.verticalSpace,
            (controller.notifications.isEmpty)
                ? SizedBox(
                    height: 420.h,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/noNoti.png",
                            scale: 0.5,
                            color: LightTheme.thirdbackgroundTheme,
                          ),
                          10.verticalSpace,
                          Text(
                            'No Notifications yet.',
                            style: TextStyle(
                                color: LightTheme.thirdbackgroundTheme,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          )
                        ]),
                  )
                : const NotiList(),
            5.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: LightTheme.mainTheme, width: 2.w)),
                      backgroundColor: MaterialStateProperty.all(
                          LightTheme.backgroundTheme)),
                  onPressed: () {
                    controller.clearNotifications();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: LightTheme.mainTheme,
                    size: 20.w,
                  ),
                  label: Text(
                    'Clear Notifications',
                    style:
                        TextStyle(color: LightTheme.mainTheme, fontSize: 14.sp),
                  )),
            ),
          ],
        ),
      );
    });
  }
}
