import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/classes/utils/order_status.dart';
import 'package:krispy_store/model/order.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/cart/components/cart_list.dart';
import 'package:krispy_store/view/navbar_pages/cart/components/dialog_box/my_dialog_box.dart';
import 'package:krispy_store/view/navbar_pages/components/title.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return Column(
        children: [
          const MainTitle(title: 'Cart'),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${controller.getTotalOrderNumber()} Items",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: LightTheme.secondaryfontTheme),
              ),
              Row(
                children: [
                  Text(
                    "Total: ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: LightTheme.secondaryfontTheme),
                  ),
                  Text(
                    "\$${controller.getTotalOrderAmount().toStringAsFixed(2)}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        color: LightTheme.fontTheme),
                  ),
                ],
              ),
            ],
          ),
          5.verticalSpace,
          const CartList(),
          5.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 130.w,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      side: BorderSide(color: LightTheme.mainTheme, width: 2.w),
                      backgroundColor: LightTheme.backgroundTheme),
                  onPressed: () {
                    controller.clearCart();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: LightTheme.mainTheme,
                  ),
                  label: Text(
                    'Clear Cart',
                    style:
                        TextStyle(color: LightTheme.mainTheme, fontSize: 12.sp),
                  ),
                ),
              ),
              SizedBox(
                width: 130.w,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(LightTheme.mainTheme)),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return MyDialog(
                              order: Order(
                                  id: controller.orderId,
                                  orderItems: controller.cartList,
                                  totalAmount: controller.getTotalOrderAmount(),
                                  totalNumOfOrderItems:
                                      controller.getTotalOrderNumber(),
                                  status: OrderStatus.pending));
                        });
                  },
                  icon: const Icon(
                    Icons.shopping_cart_checkout,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Proceed',
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
