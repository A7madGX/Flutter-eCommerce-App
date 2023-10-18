import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/components/title.dart';
import 'package:krispy_store/view/navbar_pages/favorites/components/favorite_grid.dart';
import 'package:provider/provider.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const MainTitle(title: 'Favorites'),
                10.verticalSpace,
                Row(
                  children: [
                    Text(
                      '${controller.myFavorites.length} Items',
                      style: TextStyle(
                          color: LightTheme.secondaryfontTheme,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                5.verticalSpace,
                const FavoriteGrid(),
                5.verticalSpace,
                SizedBox(
                  width: 295.w,
                  child: ElevatedButton.icon(
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(
                            color: LightTheme.mainTheme, width: 2.w)),
                        backgroundColor: MaterialStateProperty.all(
                            LightTheme.backgroundTheme)),
                    onPressed: () {
                      controller.clearFavs();
                    },
                    icon: Icon(
                      Icons.delete,
                      color: LightTheme.mainTheme,
                      size: 20.w,
                    ),
                    label: Text(
                      'Clear List',
                      style: TextStyle(
                          color: LightTheme.mainTheme, fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    });
  }
}
