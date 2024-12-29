import 'package:blogapp/utils/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'api_constant.dart';
import 'api_exception.dart';

class ApiClient {
  late Dio dio;
  late BaseOptions baseOptions;
  ApiClient() {
    baseOptions = BaseOptions(baseUrl: ApiConstant.mainUrl);

    dio = Dio(baseOptions);
  }

  Options options = Options();

  ///get request
  Future<Response> getRequest(
      {required String path, bool isTokenRequired = false}) async {
    if (isTokenRequired == true) {
      var token = await Utils.getToken();

      options.headers = baseOptions.headers..addAll({"Authorization": "Bearer $token"});

     
    }

    try {
      debugPrint("=============API REQUEST=================");
      debugPrint("Request Url: ${baseOptions.baseUrl + path}");
      var response = await dio.get(path, options: options);
      debugPrint("=============API RESPONSE=================");
      debugPrint("Status Code:  ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }

  ///post request
  Future<Response> postRequest({required String path, dynamic body, bool isTokenRequired = false}) async {
    // Map body = {"title": "newbag2", "slug": "newbag2"};


     if (isTokenRequired == true) {
      var token = await Utils.getToken();

      options.headers = baseOptions.headers..addAll({"Authorization": "Bearer $token"});

     
    }

    try {
      debugPrint("=============API REQUEST=================");
      debugPrint("Request Url: ${baseOptions.baseUrl + path}");
      debugPrint("Body: $body");
      var response = await dio.post(path, data: body, options: options);
      debugPrint("=============API RESPONSE=================");
      debugPrint("Status Code:  ${response.statusCode}");
      return response;
    } on DioException catch (e) {
      if (e.response != null) {
        debugPrint(e.response!.data.toString());
        debugPrint(e.response!.headers.toString());
        debugPrint(e.response!.requestOptions.toString());
        throw ApiException(message: e.response!.statusMessage);
      } else {
        debugPrint(e.requestOptions.toString());
        debugPrint(e.message);
        throw ApiException(message: e.message);
      }
    }
  }
}
