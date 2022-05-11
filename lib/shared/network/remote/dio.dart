import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://192.168.4.100:44306",
        receiveDataWhenStatusError: true,
        
      ),
    );
  }
  static Future<Response>getData (
    {
      required String path,
      Map<String, dynamic>? queryParameters,
    }
  ) async{
    return await dio.get(path);
  }

  static Future<Response>postData (
    {
      
      required String path,
      Map<String, dynamic>? queryParameters,
      dynamic data,
    }
  ) async{
    return await dio.post(path);
  }

  static Future<Response>delData (
    {
      required String path,
      Map<String, dynamic>? queryParameters,
      dynamic data,
    }
  ) async{
    return dio.delete(path);
  }

  static Future<Response>updateData (
    {
      required String path,
      Map<String, dynamic>? queryParameters,
      dynamic data,
    }
  ) async{
    return dio.put(path);
  }
}
