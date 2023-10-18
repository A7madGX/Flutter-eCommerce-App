import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:provider/provider.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return Column(
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
          CircleAvatar(
            radius: 52.r,
            backgroundColor: LightTheme.mainTheme,
            child: CircleAvatar(
              backgroundColor: LightTheme.mainTheme,
              radius: 50.r,
              backgroundImage: const AssetImage("assets/images/Kaneki.jpg"),
            ),
          ),
          10.verticalSpace,
          GestureDetector(
            onTap: () {},
            child: Text(
              'Edit',
              style: TextStyle(
                  color: LightTheme.secondaryfontTheme,
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp),
            ),
          ),
          10.verticalSpace,
          Container(
            width: double.infinity,
            height: 300.h,
            decoration: BoxDecoration(
                color: LightTheme.secondarybackgroundTheme,
                borderRadius: BorderRadius.circular(15.r)),
          ),
          10.verticalSpace,
          ElevatedButton(
            style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(200.w, 40.h)),
                backgroundColor:
                    MaterialStateProperty.all(LightTheme.mainTheme)),
            onPressed: () {},
            child: Text(
              'Save Changes',
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: LightTheme.lightGreyTheme),
            ),
          )
        ],
      );
    });
  }
}
