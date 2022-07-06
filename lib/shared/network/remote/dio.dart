import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://basyounisaad-001-site1.btempurl.com",
        
        receiveDataWhenStatusError: true,
        
      ),
    );
  }
  static Future<Response>getData (
    {
      required String path,
      Map ? queryParameters,
    }
  ) async{
    dio.options.headers={
      "Connection" : "keep-alive",
      "Accept":"*/*",
      "Accept-Encoding" : "gzip, deflate, br",
      "Content-Type":"application/json",
    };
    return await dio.get(path,);
  }

  static Future<Response>postData (
    {
      
      required String path,
      Map ? queryParameters,
      Map<String,dynamic>? data,
    }
  ) async{
    dio.options.headers={
      "Connection" : "keep-alive",
      "Accept":"*/*",
      "Content-Type":"application/json",
     
    };
    return await dio.post(path,data: data);
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
