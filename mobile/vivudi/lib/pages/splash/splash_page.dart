import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vivudi/base/page_base.dart';
import 'package:vivudi/pages/splash/splash_bloc.dart';
import 'package:vivudi/resources/app_assets.dart';

import '../../resources/app_color.dart';

// class SplashPage extends PageBase<SplashBloc>{
//   SplashPage({Key? key}) : super(key: key);
//
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//
//   @override
//   void onDispose() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
//     SystemChrome.setSystemUIOverlayStyle(
//       const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//       ),
//     );
//     super.onDispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//       body: Center(child: Image.asset(AppAssets.imgLauncher),),
//     );
//   }
//
// }

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final bloc = SplashBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: Image.asset(AppAssets.imgLauncher),),
    );
  }

  @override
  void initState() {
    bloc.onInit();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    bloc.onDispose();
    super.dispose();
  }
}

