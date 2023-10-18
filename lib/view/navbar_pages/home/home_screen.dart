import 'package:flutter/material.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/navbar_pages/home/home_page/home_page.dart';
import 'package:krispy_store/view/navbar_pages/home/products_page/products_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> homePages = [const Home(), const MyProducts()];
    return Consumer<StateController>(builder: (context, controller, child) {
      return homePages[controller.homepageIndex];
    });
  }
}
