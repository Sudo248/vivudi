import 'package:flutter/material.dart';
import 'package:vivudi/pages/splash/splash_page.dart';
import 'package:vivudi/routes/app_route.dart';

import '../pages/login/login_page.dart';
import '../pages/hotel/detail_hotel/detail_hotel_page.dart';

abstract class AppPages {
  static Route getPages(RouteSettings route) {
    switch (route.name) {
      case AppRoute.login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case AppRoute.detailRoom:
        var hotelId = route.arguments as String;
        return MaterialPageRoute(builder: (context) => DetailHotel(hotelId: hotelId));
      default:
        return MaterialPageRoute(builder: (context) => SplashPage());
    }
  }
}
