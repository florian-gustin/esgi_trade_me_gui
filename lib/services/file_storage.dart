
import 'dart:typed_data';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

class FileStorageService{

  Future<FilePickerResult?> getImage()async{
    return await FilePicker.platform.pickFiles();
  }

}