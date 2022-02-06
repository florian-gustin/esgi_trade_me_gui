import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:trade_me_gui/models/user.dart';
import 'package:trade_me_gui/services/s3_lambda.dart';
import 'package:trade_me_gui/services/aws_rds.dart';
import 'package:trade_me_gui/services/file_storage.dart';

class HomeController {
  HomeController(
    this._storageService,
    this._amazonWebServiceRDS,
    this._context,
  );

  final FileStorageService _storageService;
  final AmazonWebRDSService _amazonWebServiceRDS;
  final BuildContext _context;

  Future<String> addPhoto() async {
    try {
      final img = await _storageService.getImage();
      var storage = S3LambdaService();
      String presignatedURL = await storage.getPresignatedURL();
      print(presignatedURL);
      // await storage.upload(presignatedURL, img!.files.single.bytes!);
      print("UPLOADED");
      return "upload";
    } catch (e) {
      return "";
    }
  }

  Future<List<User>> getAll() async{
    final List<Map<String, dynamic>> json = await _amazonWebServiceRDS.getAll();
    final users = json.map((e) => User.fromJson(e)).toList();
    return users;
  }

  void exit() {
    _context.router.pop();
  }
}
