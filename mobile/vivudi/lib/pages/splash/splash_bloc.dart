import 'package:get_it/get_it.dart';
import 'package:vivudi/base/bloc_base.dart';
import 'package:vivudi/repositories/user_repository.dart';
import 'package:vivudi/service/network_service.dart';

import '../../routes/app_route.dart';

class SplashBloc extends BlocBase{
  final UserRepository userRepo = GetIt.I.get<UserRepository>();
  @override
  void onDispose() {}

  @override
  void onInit() async{
    await Future.delayed(const Duration(seconds: 1));
    final response = await userRepo.getMe();
    if(response.success){
      // navigate to home
      navigator.navigateOff(AppRoute.onboarding);
    } else {
      // navigate to login
      navigator.navigateOff(AppRoute.login);
    }
  }

}