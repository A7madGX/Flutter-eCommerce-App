import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/model/order_item.dart';
import 'package:krispy_store/model/product.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:provider/provider.dart';

class ProductNav extends StatelessWidget {
  final Product myProduct;
  const ProductNav({super.key, required this.myProduct});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return Container(
        margin: const EdgeInsets.all(10).w,
        height: 70.h,
        decoration: BoxDecoration(
            color: LightTheme.secondarybackgroundTheme,
            borderRadius: BorderRadius.circular(30.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                if (controller.inFavs(myProduct)) {
                  controller.removeFromFavs(myProduct);
                } else {
                  controller.addToFavs(myProduct);
                }
              },
              child: CircleAvatar(
                backgroundColor: LightTheme.lightGreyTheme,
                radius: 25.r,
                child: AnimatedCrossFade(
                  firstChild: Icon(
                    Icons.favorite_border,
                    color: LightTheme.secondaryTheme,
                    size: 30.w,
                  ),
                  secondChild: Icon(
                    Icons.favorite,
                    color: LightTheme.secondaryTheme,
                    size: 30.w,
                  ),
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: (controller.inFavs(myProduct))
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.addToCart(OrderItem(
                    product: myProduct,
                    amount: 1,
                    size: controller.getSize(),
                    color: controller.getColor()));
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(Size(250.w, 50.h)),
                backgroundColor:
                    MaterialStateProperty.all(LightTheme.mainTheme),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                    color: LightTheme.fontTheme,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
    });
  }
}
