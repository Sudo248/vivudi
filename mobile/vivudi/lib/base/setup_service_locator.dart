
import 'package:get_it/get_it.dart';
import 'package:vivudi/base/global_data.dart';
import 'package:vivudi/service/network_service.dart';

import '../service/navigator_service.dart';

void setupServiceLocator(){
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<NavigatorService>(() => NavigatorService());

  getIt.registerLazySingleton<GlobalData>(() => GlobalData(appContext: getIt.get<NavigatorService>().currentContext));

  getIt.registerLazySingleton<NetworkService>(() => NetworkService());




}