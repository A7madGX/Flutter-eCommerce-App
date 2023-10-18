import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/model/product.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  final Product myProduct;
  const ProductPage({super.key, required this.myProduct});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return Padding(
        padding: const EdgeInsets.all(20.0).w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.setColorIndex(0);
                      controller.setSizeIndex(0);
                      Navigator.of(context).pop();
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
              CarouselSlider.builder(
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: 200.h,
                    autoPlay: true,
                    enlargeCenterPage: true),
                itemCount: myProduct.images.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ClipRRect(
                  borderRadius: BorderRadius.circular(10).r,
                  child: Image.network(
                    myProduct.images[itemIndex],
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Divider(
                height: 40.h,
                thickness: 0.2.h,
                color: LightTheme.fontTheme,
              ),
              Container(
                color: LightTheme.backgroundTheme,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: 180.w,
                              ),
                              child: Text(
                                myProduct.title,
                                style: TextStyle(
                                    color: LightTheme.fontTheme,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            3.verticalSpace,
                            Text(
                              myProduct.brand,
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: LightTheme.secondaryfontTheme,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                RatingBar.builder(
                                  unratedColor:
                                      LightTheme.secondarybackgroundTheme,
                                  initialRating: myProduct.rating,
                                  minRating: 1,
                                  itemSize: 15.sp,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemPadding: const EdgeInsets.symmetric(
                                          horizontal: 1.0)
                                      .w,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                                3.horizontalSpace,
                                Text(
                                  '(${myProduct.rating})',
                                  style: TextStyle(
                                      color: LightTheme.fontTheme,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.sp),
                                )
                              ],
                            ),
                            3.verticalSpace,
                            Text(
                              '122 Reviews',
                              style: TextStyle(
                                  color: LightTheme.secondaryfontTheme,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp),
                            )
                          ],
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(
                                      color: LightTheme.fontTheme,
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                2.horizontalSpace,
                                Text(
                                  myProduct.price.toString(),
                                  style: TextStyle(
                                      color: LightTheme.fontTheme,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  '\$',
                                  style: TextStyle(
                                      color: LightTheme.secondaryfontTheme,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                2.horizontalSpace,
                                Text(
                                  (myProduct.price /
                                          (1 -
                                              (myProduct.discountPercentage /
                                                  100)))
                                      .toStringAsFixed(2)
                                      .toString(),
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 3.h,
                                      decorationColor:
                                          LightTheme.secondarybackgroundTheme,
                                      color: LightTheme.secondaryfontTheme,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                        Container(
                          width: 80.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: LightTheme.mainTheme,
                            shape: BoxShape.circle,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                myProduct.discountPercentage.round().toString(),
                                style: TextStyle(
                                    shadows: [
                                      Shadow(
                                          color: LightTheme
                                              .secondarybackgroundTheme,
                                          offset: Offset(1.5.w, 1.5.h),
                                          blurRadius: 5.r)
                                    ],
                                    fontSize: 30.sp,
                                    color: LightTheme.fontTheme,
                                    fontWeight: FontWeight.bold),
                              ),
                              3.horizontalSpace,
                              ConstrainedBox(
                                constraints: BoxConstraints(maxHeight: 30.h),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '%',
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                                color: LightTheme
                                                    .secondarybackgroundTheme,
                                                offset: Offset(1.w, 1.h),
                                                blurRadius: 1.r)
                                          ],
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: LightTheme.fontTheme),
                                    ),
                                    Text(
                                      'OFF',
                                      style: TextStyle(
                                          shadows: [
                                            Shadow(
                                                color: LightTheme
                                                    .secondarybackgroundTheme,
                                                offset: Offset(1.w, 1.h),
                                                blurRadius: 1.r)
                                          ],
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          color: LightTheme.fontTheme),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'Color',
                          style: TextStyle(
                              color: LightTheme.fontTheme,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setColorIndex(0);
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                (controller.selectedColorIndex == 0)
                                    ? LightTheme.mainTheme
                                    : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                backgroundColor: LightTheme.firstChoiceColor,
                                radius: 11.r,
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            controller.setColorIndex(1);
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                (controller.selectedColorIndex == 1)
                                    ? LightTheme.mainTheme
                                    : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                backgroundColor: LightTheme.secondChoiceColor,
                                radius: 11.r,
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            controller.setColorIndex(2);
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                (controller.selectedColorIndex == 2)
                                    ? LightTheme.mainTheme
                                    : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                backgroundColor: LightTheme.thirdChoiceColor,
                                radius: 11.r,
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            controller.setColorIndex(3);
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                (controller.selectedColorIndex == 3)
                                    ? LightTheme.mainTheme
                                    : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                backgroundColor: LightTheme.fourthChoiceColor,
                                radius: 11.r,
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            controller.setColorIndex(4);
                          },
                          child: CircleAvatar(
                            backgroundColor:
                                (controller.selectedColorIndex == 4)
                                    ? LightTheme.mainTheme
                                    : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                backgroundColor: LightTheme.fifthChoiceColor,
                                radius: 11.r,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'Available Sizes',
                          style: TextStyle(
                              color: LightTheme.fontTheme,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.setSizeIndex(0);
                          },
                          child: CircleAvatar(
                            backgroundColor: (controller.selectedSizeIndex == 0)
                                ? LightTheme.mainTheme
                                : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                radius: 13.r,
                                backgroundColor:
                                    (controller.selectedSizeIndex == 0)
                                        ? LightTheme.mainTheme
                                        : LightTheme.secondarybackgroundTheme,
                                child: Text(
                                  '38',
                                  style: TextStyle(
                                      color: LightTheme.fontTheme,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            controller.setSizeIndex(1);
                          },
                          child: CircleAvatar(
                            backgroundColor: (controller.selectedSizeIndex == 1)
                                ? LightTheme.mainTheme
                                : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                radius: 13.r,
                                backgroundColor:
                                    (controller.selectedSizeIndex == 1)
                                        ? LightTheme.mainTheme
                                        : LightTheme.secondarybackgroundTheme,
                                child: Text(
                                  '40',
                                  style: TextStyle(
                                      color: LightTheme.fontTheme,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            controller.setSizeIndex(2);
                          },
                          child: CircleAvatar(
                            backgroundColor: (controller.selectedSizeIndex == 2)
                                ? LightTheme.mainTheme
                                : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                radius: 13.r,
                                backgroundColor:
                                    (controller.selectedSizeIndex == 2)
                                        ? LightTheme.mainTheme
                                        : LightTheme.secondarybackgroundTheme,
                                child: Text(
                                  '42',
                                  style: TextStyle(
                                      color: LightTheme.fontTheme,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            controller.setSizeIndex(3);
                          },
                          child: CircleAvatar(
                            backgroundColor: (controller.selectedSizeIndex == 3)
                                ? LightTheme.mainTheme
                                : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                radius: 13.r,
                                backgroundColor:
                                    (controller.selectedSizeIndex == 3)
                                        ? LightTheme.mainTheme
                                        : LightTheme.secondarybackgroundTheme,
                                child: Text(
                                  '44',
                                  style: TextStyle(
                                      color: LightTheme.fontTheme,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            controller.setSizeIndex(4);
                          },
                          child: CircleAvatar(
                            backgroundColor: (controller.selectedSizeIndex == 4)
                                ? LightTheme.mainTheme
                                : LightTheme.backgroundTheme,
                            radius: 18.r,
                            child: CircleAvatar(
                              backgroundColor: LightTheme.backgroundTheme,
                              radius: 16.r,
                              child: CircleAvatar(
                                radius: 13.r,
                                backgroundColor:
                                    (controller.selectedSizeIndex == 4)
                                        ? LightTheme.mainTheme
                                        : LightTheme.secondarybackgroundTheme,
                                child: Text(
                                  '46',
                                  style: TextStyle(
                                      color: LightTheme.fontTheme,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.verticalSpace,
                    Row(
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                              color: LightTheme.fontTheme,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    10.verticalSpace,
                    Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 320.w),
                          child: Text(
                            myProduct.description,
                            style: TextStyle(
                                color: LightTheme.secondaryfontTheme,
                                fontSize: 13.sp),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              100.verticalSpace
            ],
          ),
        ),
      );
    });
  }
}
