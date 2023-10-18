import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/classes/utils/category.dart';
import 'package:krispy_store/model/product.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/home/products_page/components/grid.dart';
import 'package:provider/provider.dart';

class MyProducts extends StatelessWidget {
  const MyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    late List<Product> myProducts;

    return Consumer<StateController>(builder: (context, controller, child) {
      return FutureBuilder(
          future: controller.fproducts,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: LightTheme.secondarybackgroundTheme,
                  color: LightTheme.mainTheme,
                ),
              );
            }
            if (snapshot.hasData) {
              myProducts = snapshot.data ?? [];
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.selectHomePage(0);
                        },
                        child: CircleAvatar(
                          backgroundColor: LightTheme.thirdbackgroundTheme,
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: LightTheme.mainTheme,
                          ),
                        ),
                      ),
                      Text(
                        parseCategoryToString(controller.category),
                        style: TextStyle(
                            color: LightTheme.fontTheme,
                            fontSize: 25.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${myProducts.length} Items',
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: LightTheme.secondaryfontTheme,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  20.verticalSpace,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   crossAxisAlignment: CrossAxisAlignment.baseline,
                  //   textBaseline: TextBaseline.ideographic,
                  //   children: [
                  //     Text(
                  //       parseCategoryToString(controller.category),
                  //       style: TextStyle(
                  //           color: LightTheme.fontTheme,
                  //           fontSize: 25.sp,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //     Text(
                  //       '${myProducts.length} Items',
                  //       style: TextStyle(
                  //           fontSize: 12.sp,
                  //           color: LightTheme.secondaryfontTheme,
                  //           fontWeight: FontWeight.bold),
                  //     )
                  //   ],
                  // ),
                  // 20.verticalSpace,
                  MyGrid(myProducts: myProducts)
                ],
              ),
            );
          });
    });
  }
}
