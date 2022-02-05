import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';

class Storage {
  Dio dio = Dio();

  Future<dynamic> getPresignatedURL() async {
    FormData formData = FormData();

    print("hello");

    try {
      var response = await dio
          .get("https://bc9c50wvrj.execute-api.eu-west-1.amazonaws.com/Prod/");

      return response.data["uploadURL"];
    } catch (e) {
      print(e);
    }

    return "";
  }

  void get() async {
    // print(await minio.bucketExists('tradesme-bucket'));
    final stream = await minio.getObject('tradesme-bucket', 'bon.png');

    // Get object length
    // print(stream.contentLength);
  }

  Future<bool> upload(String bucketUrl, Uint8List data) {
    Map<String, String> headers = new Map<String, String>();
    headers.putIfAbsent("Content-Type", () => "image/jpeg");
    print("sending");
    bool status = false;
    Dio dios = Dio();
    dios.options.contentType = "image/jpeg";
    return dios
        .put(bucketUrl,
            data: data,
            options: Options(headers: headers))
        .then((value) => value.statusCode == 200);
  }
}


