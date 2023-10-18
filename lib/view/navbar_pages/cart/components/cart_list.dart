import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/cart/components/cart_item.dart';
import 'package:provider/provider.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: double.infinity,
        height: 420.h,
        decoration: BoxDecoration(
            color: LightTheme.backgroundTheme,
            borderRadius: BorderRadius.circular(15.r)),
        child: (controller.cartList.isEmpty)
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Image.asset(
                  "assets/images/emptyCart.png",
                  scale: 0.5,
                  color: LightTheme.secondarybackgroundTheme,
                ),
                10.verticalSpace,
                Text(
                  'Add items to the cart.',
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: LightTheme.secondarybackgroundTheme),
                )
              ])
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ...controller.cartList.map((item) => CartItem(
                          myItem: item,
                        ))
                  ],
                ),
              ),
      );
    });
  }
}
