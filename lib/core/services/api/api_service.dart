import 'package:dio/dio.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/services/observers/dio_interceptor_observer.dart';

class ApiService {
  static ApiService get instance => _instance ??= ApiService._();
  static ApiService? _instance;

  ApiService._() {
    final baseOptions = BaseOptions(
      baseUrl: AppConfig.instance.baseUrl,
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'lang': 'ar',
      },
    );
    _dio = Dio(baseOptions);
    _dio.interceptors.add(DioInterceptorObserver.instance);
  }

  late final Dio _dio;

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Response response = await _dio.get(
      endPoint,
      data: body,
      queryParameters: query,
    );
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Response response = await _dio.post(
      endPoint,
      data: body,
      queryParameters: query,
    );

    return response.data;
  }

  Future<dynamic> postFile({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Map<String, dynamic> data = {};

    if (body != null) {
      if (body.values.first.isNotEmpty) {
        String fileName = body.values.first.split('/').last;
        data.addAll({
          body.keys.first: await MultipartFile.fromFile(
            body.values.first,
            filename: fileName,
          ),
        });
      }
      body.remove(body.keys.first);
      body.forEach((key, value) {
        data.addAll({key: value});
      });
    }
    FormData formData = FormData.fromMap(data);

    Response response = await _dio.post(
      endPoint,
      data: formData,
      queryParameters: query,
    );
    return response.data;
  }

  Future<dynamic> put({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Response response = await _dio.put(
      endPoint,
      data: body,
      queryParameters: query,
    );
    return response.data;
  }

  Future<dynamic> patch({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Response response = await _dio.patch(
      endPoint,
      data: body,
      queryParameters: query,
    );
    return response.data;
  }

  Future<dynamic> delete({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, dynamic>? query,
  }) async {
    Response response = await _dio.delete(
      endPoint,
      data: body,
      queryParameters: query,
    );
    return response.data;
  }
}
