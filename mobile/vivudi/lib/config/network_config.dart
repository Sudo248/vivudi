import 'package:dio/dio.dart';
import 'package:vivudi/config/constant.dart';

abstract class NetworkConfig{
  static BaseOptions baseOptions = BaseOptions(
    baseUrl: Constant.baseUrl,
    connectTimeout: 150000,
    receiveTimeout: 150000,
  );



}