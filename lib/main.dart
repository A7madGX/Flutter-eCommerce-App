// ignore_for_file: avoid_print

import 'package:device_preview/device_preview.dart';
// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:krispy_store/classes/themes/light_theme.dart';
import 'package:krispy_store/state_controller.dart';
import 'package:krispy_store/view/main_screen.dart';
import 'package:krispy_store/view/navbar_pages/components/product/product_screen.dart';
import 'package:krispy_store/view/splash_screen/splash_screen.dart';

import 'package:provider/provider.dart';

void main() {
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => MultiProvider(providers: [
  //       ChangeNotifierProvider(create: (context) => StateController()),
  //     ], child: const MyApp()), // Wrap your app
  //   ),
  // );
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => StateController()),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("myApp rebuilt");
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Consumer<StateController>(builder: (context, controller, child) {
        return MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Krispy Store',
          theme: ThemeData(
            textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Outfit',
                bodyColor: LightTheme.fontTheme,
                displayColor: LightTheme.fontTheme),
            colorScheme: ColorScheme.fromSeed(seedColor: LightTheme.mainTheme),
            useMaterial3: true,
          ),
          initialRoute: '/splashscreen',
          routes: {
            '/splashscreen': (context) => const SplashScreen(),
            '/mainscreen': (context) => const MainScreen(),
            '/productscreen': (context) => const ProductScreen()
          },
        );
      }),
    );
  }
}
