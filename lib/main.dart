import 'package:algorizaui/view/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'constants/globals.dart';
import 'helper/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      navigatorKey: Globals.instance.navigatorKey,
      onGenerateRoute: (settings) => AppRoute.onGenerateRoutes(settings),
      home: const OnBoardingScreen(),
    );
  }
}



