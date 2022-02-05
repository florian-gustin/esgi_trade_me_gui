import 'dart:async';
import 'dart:typed_data';

import 'package:minio/minio.dart';


class Storage{
  final minio = Minio(
    endPoint: 's3.eu-west-1.amazonaws.com',
    accessKey: '',
    secretKey: '',
  );

  void add(Uint8List bits) async{
    await minio.putObject(
      'tradesme-bucket',
      "test.png",
      Stream.value(bits),
      onProgress: (bytes) => print('$bytes uploaded'),
    );
  }

  void get() async{
    // print(await minio.bucketExists('tradesme-bucket'));
    final stream = await minio.getObject('tradesme-bucket', 'bon.png');

    // Get object length
    // print(stream.contentLength);
  }

}


