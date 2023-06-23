import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Api {
  static Future<Response<dynamic>?> get(String url, String token) async {
    try {
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $token';
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('==========Dio===========');
        }
        if (kDebugMode) {
          print(response.data);
        }
        return response;
      } else {
        if (kDebugMode) {
          print('Problem!!!!!!!!!');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }

  static Future<Response<dynamic>?> post(String url, Map map) async {
    try {
      final dio = Dio();
      final response = await dio.post(url, data: map);

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('==========Dio===========');
        }
        if (kDebugMode) {
          print(response.data);
        }
        return response;
      } else {
        if (kDebugMode) {
          print('Problem!!!!!!!!!');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    return null;
  }
}
