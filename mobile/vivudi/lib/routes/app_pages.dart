import 'package:flutter/material.dart';
import 'package:vivudi/pages/splash/splash_page.dart';
import 'package:vivudi/routes/app_route.dart';

import '../pages/login/login_page.dart';

abstract class AppPages{
  static Route getPages(RouteSettings route){
    switch(route.name){
      case AppRoute.login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}