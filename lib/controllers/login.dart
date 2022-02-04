

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:trade_me_gui/pages/login.dart';
import 'package:trade_me_gui/router.gr.dart';
import 'package:trade_me_gui/services/backend.dart';

class LoginController{
  final BackEndService _api;
  final BuildContext _context;

  const LoginController(this._api, this._context);

  void authenticate(TextEditingController email, TextEditingController password, MemberType memberType){
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      final int? memberID = _api.createMembership(email.text, password.text, memberType.name);
      if(memberID != null){
        _context.router.navigate(const HomeRoute());
      }
    }
  }

}