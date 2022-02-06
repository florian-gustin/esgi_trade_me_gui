import 'package:dio/dio.dart';

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

  Future<List<Map<String, dynamic>>> getAll() async {
    try {
      var response =
          await _dio.get("https://trademe-node-rds.herokuapp.com/users");

      return response.data["results"];
    } catch (e) {
      rethrow;
    }
  }
}
