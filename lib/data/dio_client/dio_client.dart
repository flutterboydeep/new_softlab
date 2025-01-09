
import 'package:dio/dio.dart';

import '../api/api_value.dart';

class DioClient {
  Dio? dio;
  static DioClient? _instance;

  DioClient._internal() {
    dio = Dio();
    dio?.options.baseUrl = ApiContainer.baseURL;
    dio?.options.headers['Content-Type'] =
        'application/json'; // Set content type header to JSON
  }

  static DioClient get instance {
    _instance ??= DioClient._internal();
    return _instance!;
  }

  Future<Response<T>> _makeRequest<T>(String path,
      {required String method, Map<String, dynamic>? data}) async {
    try {
      final response = await dio!.request<T>(
        path,
        data: data,
        options: Options(method: method),
      );
      return response;
    } on DioError catch (e) {
      throw e;
    }
  }

  Future<Response<T>> get<T>(String path) {
    return _makeRequest<T>(path, method: 'GET');
  }

  Future<Response<T>> post<T>(String path, Map<String, dynamic> data) {
    return _makeRequest<T>(path, method: 'POST', data: data);
  }
}
