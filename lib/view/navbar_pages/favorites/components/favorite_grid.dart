import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/favorites/components/favorite_item.dart';
import 'package:provider/provider.dart';

class FavoriteGrid extends StatelessWidget {
  const FavoriteGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = 100.w;
    final double height = 110.h;
    return Consumer<StateController>(builder: (context, controller, child) {
      return Container(
        width: double.infinity,
        height: 420.h,
        decoration: BoxDecoration(
            // color: LightTheme.thirdbackgroundTheme,
            borderRadius: BorderRadius.circular(15.r)),
        child: (controller.myFavorites.isEmpty)
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  "assets/images/empty.png",
                  width: 150.w,
                  color: LightTheme.secondarybackgroundTheme,
                ),
                10.verticalSpace,
                Text(
                  'No favorites yet.',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: LightTheme.secondarybackgroundTheme),
                )
              ])
            : TweenAnimationBuilder(
                duration: const Duration(milliseconds: 500),
                tween: Tween<double>(begin: 30, end: 15),
                builder: (context, val, _) {
                  return GridView.count(
                    padding: EdgeInsets.all(val).w,
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    childAspectRatio: width / height,
                    children: [
                      ...controller.myFavoritesList.map((productId) => FavItem(
                          myProduct: controller.myFavorites[productId]!))
                    ],
                  );
                }),
      );
    });
  }
}
