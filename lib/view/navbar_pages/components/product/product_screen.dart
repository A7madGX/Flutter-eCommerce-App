import 'package:flutter/material.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/model/product.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/components/product/product_body.dart';
import 'package:krispy_store/view/navbar_pages/components/product/product_nav.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Product product = (ModalRoute.of(context)?.settings.arguments
        as Map<String, Product>)['product']!;
    return Consumer<StateController>(builder: (context, controller, child) {
      return SafeArea(
          child: Scaffold(
        extendBody: true,
        backgroundColor: LightTheme.backgroundTheme,
        body: ProductPage(
          myProduct: product,
        ),
        bottomNavigationBar: ProductNav(myProduct: product),
      ));
    });
  }
}
