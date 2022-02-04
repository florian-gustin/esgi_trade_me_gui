

import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:trade_me_gui/services/file_storage.dart';

class HomeController {
  const HomeController(this._storageService, this._context);

  final FileStorageService _storageService;
  final BuildContext _context;

  Future<String> addPhoto() async{
    try{
      final image = await _storageService.getImageAsBytes();
      final upload = _storageService.upload(image!);
      print("UPLOADED");
      return upload;
    }catch(e){
      return "";
    }

  }

  void exit() {
    _context.router.pop();
  }

}