import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/model/order.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:provider/provider.dart';

class MyDialog extends StatelessWidget {
  final Order order;
  const MyDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.w, sigmaY: 3.h),
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          margin: EdgeInsets.only(
              top: 230.h, bottom: 18.h, right: 15.w, left: 15.w),
          decoration: BoxDecoration(
              color: LightTheme.secondarybackgroundTheme.withOpacity(0.95),
              borderRadius: BorderRadius.circular(15.r)),
          duration: const Duration(milliseconds: 500),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Payment',
                    style: TextStyle(
                        color: LightTheme.fontTheme,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              5.verticalSpace,
              Container(
                decoration: BoxDecoration(
                    color: LightTheme.lightGreyTheme,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w, vertical: 8.h),
                      child: Container(
                        height: 50.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(
                                color: LightTheme.mainTheme, width: 3.w),
                            color: LightTheme.secondarybackgroundTheme,
                            image: const DecorationImage(
                                image:
                                    AssetImage('assets/images/Mastercard.jpg'),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "**** **** **** 2654",
                            style: TextStyle(
                                color: LightTheme.secondaryfontTheme,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '07/24',
                            style: TextStyle(
                                color: LightTheme.secondaryfontTheme,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20.sp,
                        color: LightTheme.secondaryfontTheme,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              Row(
                children: [
                  Text(
                    'Shipping Address',
                    style: TextStyle(
                        color: LightTheme.fontTheme,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              5.verticalSpace,
              Container(
                width: double.infinity,
                height: 80.h,
                decoration: BoxDecoration(
                    color: LightTheme.navbarTheme,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 12.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: LightTheme.fontTheme,
                                size: 20.w,
                              ),
                              2.horizontalSpace,
                              Text(
                                'Obour City',
                                style: TextStyle(
                                    color: LightTheme.fontTheme,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          8.verticalSpace,
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.circle,
                                            size: 5.w,
                                            color: LightTheme
                                                .secondarybackgroundTheme,
                                          ),
                                          5.horizontalSpace,
                                          Text(
                                            '9th District',
                                            style: TextStyle(
                                                color: LightTheme
                                                    .secondaryfontTheme,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 5.w,
                                        color:
                                            LightTheme.secondarybackgroundTheme,
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        'Block 40',
                                        style: TextStyle(
                                            color:
                                                LightTheme.secondaryfontTheme,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              30.horizontalSpace,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 5.w,
                                        color:
                                            LightTheme.secondarybackgroundTheme,
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        'Building 2',
                                        style: TextStyle(
                                            color:
                                                LightTheme.secondaryfontTheme,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        size: 5.w,
                                        color:
                                            LightTheme.secondarybackgroundTheme,
                                      ),
                                      5.horizontalSpace,
                                      Text(
                                        'Apartment 12',
                                        style: TextStyle(
                                            color:
                                                LightTheme.secondaryfontTheme,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        size: 20.sp,
                        color: LightTheme.secondaryfontTheme,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              10.verticalSpace,
              Row(
                children: [
                  Text(
                    'Payment Details',
                    style: TextStyle(
                        color: LightTheme.fontTheme,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              5.verticalSpace,
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
                height: 110.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: LightTheme.navbarTheme,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Sub Total',
                          style: TextStyle(
                              color: LightTheme.fontTheme.withOpacity(0.7),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${order.totalAmount.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: LightTheme.fontTheme.withOpacity(0.7),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    3.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fees',
                          style: TextStyle(
                              color: LightTheme.fontTheme.withOpacity(0.7),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${(order.totalAmount * 0.12).toStringAsFixed(2)}',
                          style: TextStyle(
                              color: LightTheme.fontTheme.withOpacity(0.7),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    3.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery',
                          style: TextStyle(
                              color: LightTheme.fontTheme.withOpacity(0.7),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$10.00',
                          style: TextStyle(
                              color: LightTheme.fontTheme.withOpacity(0.7),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Divider(
                      height: 20.h,
                      color: LightTheme.secondaryfontTheme,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              color: LightTheme.fontTheme,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${(order.totalAmount + order.totalAmount * 0.12 + 10).toStringAsFixed(2)}',
                          style: TextStyle(
                              color: LightTheme.fontTheme,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              7.verticalSpace,
              SizedBox(
                width: double.infinity,
                height: 30.h,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(LightTheme.mainTheme)),
                  onPressed: () {
                    AwesomeDialog(
                      buttonsTextStyle:
                          TextStyle(fontSize: 18.sp, color: Colors.white),
                      dialogBackgroundColor: LightTheme.backgroundTheme,
                      btnOkColor: LightTheme.mainTheme,
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.rightSlide,
                      title: 'Payment Successful',
                      desc: 'A Notification will be sent shortly..',
                      btnOkOnPress: () {
                        controller.addOrder(order);
                        Navigator.of(context).pop();
                      },
                    ).show();
                  },
                  child: Text(
                    'Submit Order',
                    style: TextStyle(
                        color: LightTheme.lightGreyTheme,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
