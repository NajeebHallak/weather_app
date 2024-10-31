import 'dart:developer';

import 'package:dio/dio.dart';

class Api {
  final Dio dio;

  Api(this.dio);
  Future<Map<String, dynamic>> get({required url}) async {
    try {
      Response response = await dio.get(url);
      Map<String, dynamic> theData = response.data;
      return theData;
    } on DioException catch (e) {
      final String massageError =
          e.response?.data["error"]['message'] ?? 'oops try later';
      throw Exception(massageError);
    } catch (e) {
      log(e.toString());
      throw Exception('noo result try later');
    }
  }
}
