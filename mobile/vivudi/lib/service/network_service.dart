import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'package:vivudi/base/log.dart';
import 'package:vivudi/config/network_config.dart';

class NetworkService {
  final Dio _dio = Dio(NetworkConfig.baseOptions);

  NetworkService() {
    initDio();
  }

  void initDio() {
    Log.success(message: "init dio");
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      Log.debug(key: "onRequest", message: "${options.uri}");
      return handler.next(options);
    }, onResponse: (response, handler) {
      Log.debug(
          key: "onResponse",
          message: "${response.statusCode} ${response.statusMessage}");
      return handler.next(response);
    }, onError: (DioError e, handler) {
      Log.error(message: e.message);
      Log.error(message: "${e.response?.data}");
      return handler.next(e);
    }));
  }

  set headers(Map<String, dynamic>? headers) => _dio.options.headers = headers;

  Map<String, dynamic> get headers => _dio.options.headers;

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _dio.delete(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future<Response> uploadImage(
    String path, {
    required File image,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final length = await image.length();
    final imageName = basename(image.path);
    MultipartFile multipartImage = MultipartFile(image.openRead(), length, filename: imageName);
    final formData = FormData.fromMap({
      "image": multipartImage
    });

    options ??= Options(
      contentType: 'multipart/form-data',
    );

    return _dio.post(
      path,
      data: formData,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onReceiveProgress,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> uploadImages(
    String path, {
    required Map<String, File> images,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    Map<String, MultipartFile> imageMap = {};

    Future<void> addImageMap(String key, File image) async {
      String imageName = basename(image.path);
      imageMap[key] = MultipartFile(image.openRead(), await image.length(),
          filename: imageName);
    }

    Future<void> lastAdd = Future.value();
    images.forEach((key, value) {
      lastAdd = addImageMap(key, value);
    });

    await lastAdd;
    options ??= Options(
        contentType: 'multipart/form-data',
    );
    return _dio.post(
      path,
      data: FormData.fromMap(imageMap),
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
    );
  }
}
