import 'package:dio/dio.dart';
import 'package:shopbox_pos/core/constants/api_endpoints.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    BaseOptions options = BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    dio = Dio(options);
  }

  static void setToken(String token) {
    dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static Future<Response> get(String url, {Map<String, dynamic>? query}) async {
    try {
      return await dio.get(url, queryParameters: query);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Response> post(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await dio.post(url, data: data, queryParameters: query);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Response> put(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await dio.put(url, data: data, queryParameters: query);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Future<Response> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await dio.delete(url, data: data, queryParameters: query);
    } catch (e) {
      return _handleError(e);
    }
  }

  static Response _handleError(Object error) {
    if (error is DioException) {
      return Response(
        requestOptions: error.requestOptions,
        statusCode: error.response?.statusCode ?? 500,
        data: {'message': error.message, 'error': true},
      );
    }
    return Response(
      requestOptions: RequestOptions(path: ''),
      statusCode: 500,
      data: {'message': 'Unknown error occurred', 'error': true},
    );
  }
}
