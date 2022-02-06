import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:trade_me_gui/models/user.dart';

class AmazonWebRDSService {
  final Dio _dio;

  AmazonWebRDSService(this._dio);

  Future<Map<String, dynamic>> add(String email) async {
    try {
      var response =
          await _dio.post('https://trademe-node-rds.herokuapp.com/user',
              data: {"email": email},
              options: Options(
                headers: {
                  "Content-Type": "application/json"
                },
              ));
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<User>> getAll() async {
    try {
      var response =
          await _dio.get("https://trademe-node-rds.herokuapp.com/users", options: Options(
            headers: {
              "Content-Type": "application/json"
            },
          ));

      final data = response.data["results"] as List<dynamic>;
      return data.map((e) => User.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
