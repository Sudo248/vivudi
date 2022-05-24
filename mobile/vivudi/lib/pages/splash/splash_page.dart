import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vivudi/pages/hotel/update_hotel/update_hotel_page.dart';
import 'package:vivudi/pages/onboarding/onboarding_page.dart';
import 'package:vivudi/resources/app_color.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const UpdateHotelPage())));

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      // body: Center(
      //   child: SvgPicture.asset('assets/svg/app_icon.svg'),
      // ),
    );
  }
}
