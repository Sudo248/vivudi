import 'package:flutter/material.dart';
import 'package:vivudi/pages/hotel/add_hotel/add_hotel_page.dart';
import 'package:vivudi/pages/onboarding/onboarding_page.dart';
import 'package:vivudi/pages/splash/splash_page.dart';
import 'package:vivudi/routes/app_route.dart';

import '../pages/login/login_page.dart';
import '../pages/hotel/detail_hotel/detail_hotel_page.dart';

abstract class AppPages {
  static Route getPages(RouteSettings route) {
    switch (route.name) {
      case AppRoute.login:
        return MaterialPageRoute(builder: (context) => const LoginPage());
      case AppRoute.detailRoom:
        var hotelId = route.arguments as String;
        return MaterialPageRoute(builder: (context) => DetailHotel(hotelId: hotelId));
      case AppRoute.onboarding:
        return MaterialPageRoute(builder: (context) => const Onboarding());
      case AppRoute.addHotel:
        return MaterialPageRoute(builder: (context) => const AddHotelPage());
      default:
        return MaterialPageRoute(builder: (context) => const SplashPage());
    }
  }
}
