import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/model/order_item.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final OrderItem myItem;
  const CartItem({super.key, required this.myItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/productscreen',
              arguments: {'product': myItem.product});
        },
        child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 500),
            tween: Tween<double>(begin: 10, end: 5),
            builder: (context, val, child) {
              return Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: val.h),
                  width: double.infinity,
                  height: 100.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(3.w, 3.w),
                          blurRadius: 5.r,
                          color: LightTheme.darkgreyTheme.withOpacity(0.6))
                    ],
                    borderRadius: BorderRadius.circular(20.r),
                    color: LightTheme.backgroundTheme,
                  ),
                  child: child);
            },
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(20.r)),
                  child: Container(
                    width: 110.w,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: LightTheme.greyTheme,
                      image: DecorationImage(
                        image: NetworkImage(myItem.product.thumbnail),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0).w,
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: 120.w,
                                maxHeight: 30.h,
                                minWidth: 120.w),
                            child: Text(
                              myItem.product.title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp,
                                  color: LightTheme.fontTheme),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Color: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: LightTheme.secondaryfontTheme),
                              ),
                              Container(
                                width: 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                    color: myItem.color,
                                    borderRadius: BorderRadius.circular(2.r)),
                              )
                            ],
                          ),
                          Text(
                            'Size: ${myItem.size}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: LightTheme.secondaryfontTheme),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              Text(
                                '\$',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: LightTheme.fontTheme),
                              ),
                              Text(
                                (myItem.product.price * myItem.amount)
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                    color: LightTheme.fontTheme),
                              ),
                            ],
                          ),
                        ],
                      ),
                      15.horizontalSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.addToCart(myItem);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: LightTheme.mainTheme),
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                size: 17.w,
                                color: LightTheme.mainTheme,
                              ),
                            ),
                          ),
                          Text(
                            '${myItem.amount}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: LightTheme.fontTheme),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.removeFromCart(myItem);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: LightTheme.mainTheme),
                                borderRadius: BorderRadius.circular(
                                  5.r,
                                ),
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 17.w,
                                color: LightTheme.mainTheme,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      );
    });
  }
}
