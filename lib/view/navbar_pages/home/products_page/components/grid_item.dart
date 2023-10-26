import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/model/product.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyGridItem extends StatefulWidget {
  final Product myProduct;
  const MyGridItem({super.key, required this.myProduct});

  @override
  State<MyGridItem> createState() => _MyGridItemState();
}

class _MyGridItemState extends State<MyGridItem>
    with SingleTickerProviderStateMixin {
  late final Product myProduct = widget.myProduct;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      if (controller.inFavs(myProduct)) {
        animationController.animateTo(0.6);
      }
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/productscreen', arguments: {'product': myProduct});
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.r),
          child: Container(
            decoration: BoxDecoration(
              color: LightTheme.backgroundTheme,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  width: double.infinity,
                  height: 135.h,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15.r)),
                    color: LightTheme.darkgreyTheme,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(myProduct.thumbnail),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (controller.inFavs(myProduct)) {
                            controller.removeFromFavs(myProduct);
                            animationController.animateTo(1);
                          } else {
                            controller.addToFavs(myProduct);
                            animationController.reset();
                            animationController.animateTo(0.6);
                          }
                        },
                        child: Stack(children: [
                          Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                                color: LightTheme.backgroundTheme,
                                shape: BoxShape.circle),
                          ),
                          Positioned(
                            top: -10.h,
                            left: -10.w,
                            child: Lottie.asset('assets/icons/favorite.json',
                                controller: animationController,
                                width: 45.w,
                                height: 45.h),
                          )
                          // Icon(
                          //   (controller.inFavs(myProduct))
                          //       ? Icons.favorite
                          //       : Icons.favorite_border,
                          //   color: Colors.red,
                          //   size: 16.w,
                          // ),
                        ]),
                      ),
                      Icon(
                        Icons.navigate_next_sharp,
                        color: LightTheme.backgroundTheme,
                        size: 25.w,
                      ),
                    ],
                  ),
                ),
                5.verticalSpace,
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0.h, horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints(maxHeight: 30.h, minHeight: 30.h),
                        child: Text(
                          myProduct.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: LightTheme.fontTheme),
                        ),
                      ),
                      5.verticalSpace,
                      // Divider(
                      //   thickness: 0.3.h,
                      //   height: 15.h,
                      //   color: LightTheme.fontTheme,
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(
                                      color: LightTheme.secondaryfontTheme,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8.sp),
                                ),
                                Text(
                                  myProduct.price.toString(),
                                  style: TextStyle(
                                      color: LightTheme.secondaryfontTheme,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 11.w,
                                color: Colors.amber,
                              ),
                              3.horizontalSpace,
                              Text(
                                myProduct.rating.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: LightTheme.secondaryfontTheme),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
