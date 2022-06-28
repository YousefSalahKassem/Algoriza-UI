import 'package:flutter/cupertino.dart';

import '../constants/globals.dart';
import '../view/login_screen.dart';
import '../view/on_boarding.dart';
import '../view/register_screen.dart';

class AppRoute{
  static const String onBoard='/onBoard';
  static const String login='/login';
  static const String signUp='/signUp';

  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings){
    Widget getPage(String? name){
      switch (name){
        case login: return LoginScreen();

        case signUp: return RegisterScreen();

        default: return const OnBoardingScreen();
      }
    }
    return CupertinoPageRoute(settings: routeSettings,builder: (context) => getPage(routeSettings.name));
  }

  static Route<T> getRoute<T>(Widget widget, [String? name]) {
    return CupertinoPageRoute(
        settings: RouteSettings(name: name), builder: (context) => widget);
  }


  static Future<T?>? push<T extends Object?>(Widget page, {String? name}) =>
      Globals.instance.navigatorKey.currentState?.push<T>(getRoute(page, name));

  static Future<T?>? pushReplacement<T extends Object?, TO extends Object>(
      Widget page,
      {String? name,
        TO? result}) =>
      Globals.instance.navigatorKey.currentState
          ?.pushReplacement<T, TO>(getRoute(page, name), result: result);

  static Future<T?>? pushNamed<T extends Object?>(String page) =>
      Globals.instance.navigatorKey.currentState?.pushNamed<T>(page);

  static void pop<T extends Object?>() =>
      Globals.instance.navigatorKey.currentState?.pop<T>();


}