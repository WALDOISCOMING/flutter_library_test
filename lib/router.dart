import 'package:flutter/material.dart';
import 'package:library_test/MainPage.dart';
import 'package:library_test/PermissionPage.dart';
import 'package:library_test/undefined_view.dart';

import 'AnimationPage.dart';
import 'BLoCPage.dart';
import 'LoggerPage.dart';
import 'SecureStoragePage.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name){
    case "/":
      return MaterialPageRoute(builder: (context)=> MainPageWidget());
    case "/permission":
      var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context)=> PermissionHandlerWidget());
    case "/logger":
      var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context)=> LoggerHandlerWidget());
    case "/anim":
      var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context)=> TransitionsHomePage());
    case "/bloc":
      var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context)=> BLoCHandlerWidget());
  // return MaterialPageRoute(builder: (context)=> LoginView(argument: arguments));
    default:
      return MaterialPageRoute(builder: (context)=> UndefinedView(name :settings.name));
  }
}