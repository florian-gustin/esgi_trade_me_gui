
import 'dart:typed_data';
import 'dart:ui';

import 'package:image_picker_web/image_picker_web.dart';

class FileStorageService{

  String upload(Uint8List bits){
    return "google.com";
  }

  Future<Image?> getImageAsWidget()async{
    await ImagePickerWeb.getImageAsWidget();
  }

  Future<Uint8List?> getImageAsBytes()async{
    await ImagePickerWeb.getImageAsBytes();
  }

}