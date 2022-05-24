
import 'package:get_it/get_it.dart';
import 'package:vivudi/base/global_data.dart';
import 'package:vivudi/pages/login/login_bloc.dart';
import 'package:vivudi/repositories/hotel_repository.dart';
import 'package:vivudi/repositories/user_repository.dart';
import 'package:vivudi/service/network_service.dart';

import '../service/navigator_service.dart';

void setupServiceLocator(){
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<NavigatorService>(() => NavigatorService());

  getIt.registerLazySingleton<GlobalData>(() => GlobalData(appContext: getIt.get<NavigatorService>().currentContext));

  getIt.registerLazySingleton<NetworkService>(() => NetworkService());

  getIt.registerLazySingleton<UserRepository>(() => UserRepository(networkService: getIt.get<NetworkService>()));

  getIt.registerLazySingleton<HotelRepository>(()=>HotelRepository(networkService: getIt.get<NetworkService>()));

}