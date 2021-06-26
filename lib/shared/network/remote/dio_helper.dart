import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.nytimes.com/',
      receiveDataWhenStatusError: true,
    ));
  }
     //https://api.nytimes.com/svc/topstories/v2/home.json?api-key=3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9
    //baseurl:https://api.nytimes.com/
   //method:svc/topstories/v2/home.json
  //query:api-key=3mh2JkNo6RqrYZxAnNmdyvLdFnKBMfh9

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }
}
