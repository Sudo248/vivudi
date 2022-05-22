import 'package:vivudi/base/util_base.dart';

abstract class BlocBase with UtilBase {
  void onInit();
  void onDispose();
}