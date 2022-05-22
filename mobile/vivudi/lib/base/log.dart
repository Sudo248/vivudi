import 'package:flutter/foundation.dart';
class Log {
  final String key, message;
  // error
  Log.error({this.key = "ERROR", required this.message}) {
    if (!kReleaseMode) {
      // red
      // ignore: avoid_print
      print('\x1B[31m==> $key : $message\x1B[0m');
    }
  }
  // debug
  Log.debug({this.key = "Debug", required this.message}) {
    if (!kReleaseMode) {
      // cyan
      // ignore: avoid_print
      print('\x1B[36m==> $key : $message\x1B[0m');
    }
  }
  // warning
  Log.warning({this.key = "Warning", required this.message}) {
    if (!kReleaseMode) {
      // yellow
      // ignore: avoid_print
      print('\x1B[33m==> $key : $message\x1B[0m');
    }
  }

  // success
  Log.success({this.key = "Success", required this.message}) {
    if (!kReleaseMode) {
      // green
      // ignore: avoid_print
      print('\x1B[32m==> $key : $message\x1B[0m');
    }
  }
}