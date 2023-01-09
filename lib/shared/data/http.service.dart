import 'dart:async';
import 'package:dio/dio.dart';

class DioClient {
  late Dio _dio;

  DioClient(
    baseUrl, [
    int timeOut = 20,
  ]) {
    var baseOptions = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: timeOut * 1000,
      receiveTimeout: timeOut * 1000,
      sendTimeout: timeOut * 1000,
    );
    _dio = Dio(baseOptions);
    }

  Future<List<dynamic>> getMany(
    String uri,
  ) async {
    try {
      var response = await _dio.get(uri);
      return response.data['results'];
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<dynamic> getOne(String uri) async {
    try {
      var response = await _dio.get(uri);
      return response.data;
    } on DioError catch (error) {
      rethrow;
    }
  }

}
