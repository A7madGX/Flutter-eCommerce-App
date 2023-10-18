import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/model/product.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:provider/provider.dart';

class FavItem extends StatelessWidget {
  final Product myProduct;
  const FavItem({super.key, required this.myProduct});

  @override
  Widget build(BuildContext context) {
    return Consumer<StateController>(builder: (context, controller, child) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/productscreen', arguments: {'product': myProduct});
        },
        child: Stack(children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: LightTheme.backgroundTheme,
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(5.w, 2.h),
                  blurRadius: 5.r,
                  color: LightTheme.darkgreyTheme.withOpacity(0.6),
                )
              ],
              image: DecorationImage(
                  image: NetworkImage(
                    myProduct.thumbnail,
                  ),
                  fit: BoxFit.cover),
            ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     SizedBox(
            //       width: 80.w,
            //       child: Text(
            //         myProduct.title,
            //         style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 15.sp,
            //           fontWeight: FontWeight.bold,
            //         ),
            //         maxLines: 2,
            //         overflow: TextOverflow.fade,
            //       ),
            //     ),
            //   ],
            // ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                controller.removeFromFavs(myProduct);
              },
              icon: Icon(
                Icons.favorite,
                color: LightTheme.secondaryTheme,
              ),
            ),
          ),
          Positioned(
              bottom: 7.h,
              right: 7.h,
              child: Icon(
                Icons.navigate_next_sharp,
                color: Colors.black,
                size: 25.w,
              )),
          // Positioned(
          //   bottom: 10.w,
          //   left: 10.w,
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.baseline,
          //     textBaseline: TextBaseline.ideographic,
          //     children: [
          //       const Text(
          //         '\$',
          //         style: TextStyle(color: Colors.black),
          //       ),
          //       Text(
          //         myProduct.price.toString(),
          //         style: TextStyle(
          //             fontSize: 20.sp,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.black),
          //       )
          //     ],
          //   ),
          // )
        ]),
      );
    });
  }
}
