import 'package:get_it/get_it.dart';

import '../service/navigator_service.dart';
import 'global_data.dart';

mixin UtilBase {
  final navigator = GetIt.I.get<NavigatorService>();
  final globalData = GetIt.I.get<GlobalData>();
}
