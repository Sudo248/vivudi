import 'package:get_it/get_it.dart';
import 'package:vivudi/base/bloc_base.dart';
import 'package:vivudi/repositories/user_repository.dart';
import 'package:vivudi/routes/app_route.dart';

import '../../model/user/user.dart';

class ProfileBloc extends BlocBase{
  final userRepo = GetIt.I.get<UserRepository>();
  String? username;
  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onInit() async{
    final response = await userRepo.getMe();
    if(response.success){
      username = "${response.firstName} ${response.lastName}";
    }
  }

  Future<void> logout() async{
    await userRepo.logout();
    navigator.navigateOff(AppRoute.login);
  }





}