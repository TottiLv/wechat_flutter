import 'package:dio/dio.dart';

class HttpManager {
  static final Dio dio = Dio();

  static Future request(
    String url,
    {String method = 'get',
      Map<String, dynamic> queryParameters,
      int timeOut
    }){
        //创建配置,什么方式请求
      //int sendTimeout,
    //    int receiveTimeout,
      final options = Options(method: method,sendTimeout: timeOut, receiveTimeout: timeOut);
      //发网络请求
      return dio.request(url,queryParameters: queryParameters,options: options);
}
}

Future<Response> get(url,
  { Map<String, dynamic> headers,
    Map<String, dynamic> queryParameters,
    int timeOut
  }
    ){
  return HttpManager.request(url, queryParameters: queryParameters, method: 'get', timeOut: timeOut);
}