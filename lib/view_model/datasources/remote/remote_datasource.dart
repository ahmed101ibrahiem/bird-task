
import 'package:bird_task/core/constants/app_constants.dart';
import 'package:dio/dio.dart';



//Dio Helper That's Connect and Talk to API.
class DioHelper {
  static late Dio dio;

  //Here The Initialize of Dio and Start Connect to API Using baseUrl.
  static init() {
    dio = Dio(
      BaseOptions(
        //Here the URL of API.
        baseUrl: AppConstants.baseUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveDataWhenStatusError: true,
        receiveTimeout: const Duration(seconds: 5),
        headers: {
          'Accept': 'application/json',
        },
      ),
    );
  }



  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
    FormData? formData,
    //bool files = false,
    String? token,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      dio.options.headers = {
        'Authentication': token ?? '',
        'Content-Type' : data != null ? "application/json": 'multipart/form-data'
      };
      final Response response = await dio.post(
        url,
        data: data ?? formData,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }

  }

}