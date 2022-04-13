import 'package:flutter/material.dart';
import 'package:library_test/MainPage.dart';
import 'package:library_test/PermissionPage.dart';
import 'package:library_test/undefined_view.dart';

import 'AnimationPage.dart';
import 'BLoCPage.dart';
import 'BackgroundPage.dart';
import 'LoggerPage.dart';
import 'RecorderPage.dart';
import 'SecureStoragePage.dart';
import 'WebviewPage.dart';

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
    case "/record":
      var arguments = settings.arguments;
      String path = '/test';
      return MaterialPageRoute(builder: (context)=> AudioRecorder(onStop: (String path) { print('stop!'); },));
    case "/webview":
      var arguments = settings.arguments;
      String path = '/test';
      return MaterialPageRoute(builder: (context)=> WebViewExample());
  // return MaterialPageRoute(builder: (context)=> LoginView(argument: arguments));
    case "/broadcast":
      var arguments = settings.arguments;
      String path = '/test';
      return MaterialPageRoute(builder: (context)=> BackgroundHandlerWidget());
    default:
      return MaterialPageRoute(builder: (context)=> UndefinedView(name :settings.name));
  }
}