// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/components/title.dart';
import 'package:krispy_store/view/navbar_pages/home/home_page/components/categories.dart';
import 'package:krispy_store/view/navbar_pages/home/products_page/components/grid.dart';
import 'package:krispy_store/view/navbar_pages/home/home_page/components/search_bar.dart';
import 'package:krispy_store/view/navbar_pages/home/home_page/components/slider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const MainTitle(title: 'Home'),
            15.verticalSpace,
            const Search(),
            30.verticalSpace,
            Row(
              children: [
                Text(
                  'Latest Offers',
                  style: TextStyle(
                      color: LightTheme.fontTheme,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            10.verticalSpace,
            const MySlider(),
            30.verticalSpace,
            Row(
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                      color: LightTheme.fontTheme,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            // 10.verticalSpace,
            const MyCategories(),
            70.verticalSpace,

            // 15.verticalSpace,
            // const Categories(),
            // 10.verticalSpace,
            // Row(
            //   children: [
            //     Text(
            //       "267 Items",
            //       style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: LightTheme.secondaryfontTheme,
            //           fontSize: 15.sp),
            //     )
            //   ],
            // ),
            // const MyGrid()
          ],
        ),
      );
    });
  }
}
