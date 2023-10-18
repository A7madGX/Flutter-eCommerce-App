import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/model/notification.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:provider/provider.dart';

class NotiItem extends StatelessWidget {
  final NotificationMessage myNoti;
  const NotiItem({super.key, required this.myNoti});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      padding: EdgeInsets.all(10.w),
      height: 65.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 241, 241, 241),
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  offset: Offset(1.w, 1.h),
                  blurRadius: 3.r,
                  color: LightTheme.darkgreyTheme.withOpacity(0.6))
            ]),
            child: CircleAvatar(
              backgroundColor: LightTheme.mainTheme,
              radius: 25.r,
              child: Icon(
                Icons.notifications,
                color: LightTheme.thirdbackgroundTheme,
                size: 30.w,
              ),
            ),
          ),
          15.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(myNoti.title,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: LightTheme.darkgreyTheme)),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: 20.w, maxWidth: 140.w, minHeight: 12.h),
                  child: Text(
                    myNoti.description,
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF4D4D4D)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  myNoti.formatDateTime(),
                  style: TextStyle(
                      color: LightTheme.greyTheme,
                      fontWeight: FontWeight.bold,
                      fontSize: 9.sp),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                      offset: Offset(1.w, 1.h),
                      blurRadius: 3.r,
                      color: LightTheme.darkgreyTheme.withOpacity(0.3))
                ]),
                child: CircleAvatar(
                  radius: 12.r,
                  backgroundColor: LightTheme.thirdbackgroundTheme,
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<StateController>()
                          .deleteNotification(myNoti);
                    },
                    icon: const Icon(Icons.remove),
                    color: LightTheme.fontTheme,
                    iconSize: 10.w,
                  ),
                ),
              ),
              5.horizontalSpace
            ],
          )
        ],
      ),
    );
  }
}
