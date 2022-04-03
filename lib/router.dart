import 'package:flutter/material.dart';
import 'package:library_test/MainPage.dart';
import 'package:library_test/PermissionPage.dart';
import 'package:library_test/undefined_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch(settings.name){
    case "/":
      return MaterialPageRoute(builder: (context)=> MainPageWidget());
    case "/permission":
      var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context)=> PermissionHandlerWidget());
  // return MaterialPageRoute(builder: (context)=> LoginView(argument: arguments));
    default:
      return MaterialPageRoute(builder: (context)=> UndefinedView(name :settings.name));
  }
}