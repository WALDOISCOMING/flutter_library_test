import 'dart:async';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:library_test/fbroadcast/broadcast_keys.dart';
import 'package:library_test/fbroadcast/user.dart';
FBroadcast? fBroadcast()=> null;

class LoginHandler {
  String _userName="";
  String _password="";

  /// set user name, check to see if login is allowed
  set userName(String v) {
    _userName = v;
    if (_textNoEmpty(_userName) && _textNoEmpty(_password)) {
      fBroadcast()!.broadcast(Key_Login, value: true);
    } else {
      fBroadcast()!.broadcast(Key_Login, value: false);
    }
  }

  /// set user password, check to see if login is allowed
  set password(String v) {
    _password = v;
    if (_textNoEmpty(_userName) && _textNoEmpty(_password)) {
      fBroadcast()!.broadcast(Key_Login, value: true);
    } else {
      fBroadcast()!.broadcast(Key_Login, value: false);
    }
  }

  /// login
  void login() {
    Timer(Duration(milliseconds: 1500), () {
      /// login success，send login success message —— Key_User
      fBroadcast()!.broadcast(
        Key_User,
        value: User()
          ..avatar = "assets/logo.png"
          ..name = _userName
          ..info =
              "Seriously provide exquisite widget to help you build exquisite application.",
        /// Persistence Key_User
        persistence: true,
      );
    });
  }
}

bool _textNoEmpty(String text) {
  return text != null && text.length != 0;
}
