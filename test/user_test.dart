
import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:trade_me_gui/models/user.dart';

void main(){
  group('User class', () {
    test('default constructor', () {
      final User user = User(email: "user@email.com");

      expect(user.email, "user@email.com");
    });
    test('fromJson factory constructor', () {
      final User user = User(email: "user@email.com");

      expect(user.email, "user@email.com");
    });
  });

}