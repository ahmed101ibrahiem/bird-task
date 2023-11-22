

import 'package:dio/dio.dart';

abstract class NetworkService{
  Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    FormData? formData,
    String? token,
  });
}


class NetworkServiceImpl implements NetworkService {
  final Dio dio;
  NetworkServiceImpl({required this.dio});

  @override
  Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    FormData? formData,
    String? token,
  }) async {
    try {
      dio.options.headers = {
        'Authorization': 'Bearer ${token ?? ''}',
        'Content-Type' : data != null ? "application/json": 'multipart/form-data'
      };
      final Response response = await dio.post(
        url,
        data: data ?? formData,
      );
      return response;
    } catch (e) {
      rethrow;
    }

  }
}
