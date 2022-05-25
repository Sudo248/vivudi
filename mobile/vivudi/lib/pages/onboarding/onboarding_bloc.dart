import 'package:vivudi/base/bloc_base.dart';
import 'package:vivudi/routes/app_route.dart';

class OnboardingBloc extends BlocBase {
  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() {
    // TODO: implement onInit
  }

  void addHotel() {
    navigator.navigateTo(AppRoute.addHotel);
  }
}
