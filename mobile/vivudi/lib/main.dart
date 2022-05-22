import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:vivudi/base/setup_service_locator.dart';
import 'package:vivudi/pages/splash/splash_page.dart';
import 'package:vivudi/resources/app_theme.dart';
import 'package:vivudi/routes/app_pages.dart';
import 'package:vivudi/service/navigator_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const VivudiApp());
}

class VivudiApp extends StatelessWidget {
  const VivudiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: GetIt.I.get<NavigatorService>().navigatorKey,
      onGenerateRoute: (route) => AppPages.getPages(route),
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
