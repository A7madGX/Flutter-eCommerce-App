import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/model/product.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/home/products_page/components/grid_item.dart';
import 'package:provider/provider.dart';

class MyGrid extends StatelessWidget {
  final List<Product> myProducts;
  const MyGrid({super.key, required this.myProducts});

  @override
  Widget build(BuildContext context) {
    final double width = 100.w;
    final double height = 148.h;
    return Consumer<StateController>(builder: (context, controller, child) {
      return Container(
        decoration: BoxDecoration(
            color: LightTheme.backgroundTheme,
            borderRadius: BorderRadius.circular(15.r)),
        width: double.infinity,
        height: 500.h,
        child: GridView.count(
          padding: EdgeInsets.all(15.w),
          crossAxisSpacing: 15.w,
          mainAxisSpacing: 15.h,
          crossAxisCount: 2,
          childAspectRatio: width / height,
          children: [
            ...myProducts.map((product) => MyGridItem(
                  myProduct: product,
                )),
          ],
        ),
      );
    });
  }
}
