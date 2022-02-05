


import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:image_picker_web/src/extensions/file_extensions.dart';
import 'package:trade_me_gui/infrastructure/s3_upload.dart';
import 'package:trade_me_gui/services/file_storage.dart';

class HomeController {
  const HomeController(this._storageService, this._context);

  final FileStorageService _storageService;
  final BuildContext _context;



  Future<String> addPhoto() async{
    try{
      // final File? file = await ImagePickerWeb.getImageAsFile();
      // final image = await _storageService.getImageAsBytes();

      // final upload = _storageService.upload(image!);
      final img = await FilePicker.platform.pickFiles();
      var storage = Storage();
       storage.get();
      // storage.add(img!.files.single.bytes!);
      print("UPLOADED");
      return "upload";
    }catch(e){
      return "";
    }

  }

  void exit() {
    _context.router.pop();
  }

}