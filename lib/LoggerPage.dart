import 'package:flutter/material.dart';
import 'dart:io';
import 'package:logger/logger.dart';

class LoggerHandlerWidget extends StatefulWidget {
  /// Create a page containing the functionality of this plugin

  @override
  _LoggerHandlerWidgetState createState() => _LoggerHandlerWidgetState();
}

enum LoggerType { v, d, i, w, e, wtf }

class _LoggerHandlerWidgetState extends State<LoggerHandlerWidget> {
  String? message;
  TextEditingController myController = TextEditingController();
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  void printLogger(LoggerType loggerType, String? input) {
    var message = input ?? 'test input message';
    switch (loggerType) {
      case LoggerType.v:
        logger.v(message);
        break;
      case LoggerType.d:
        logger.d(message);
        break;
      case LoggerType.i:
        logger.i(message);
        break;
      case LoggerType.w:
        logger.w(message);
        break;
      case LoggerType.e:
        logger.e(message);
        break;
      case LoggerType.wtf:
        logger.wtf(message);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 40),
          child: TextField(
              controller: myController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'input user logger message',
              )),
        ),
        TextButton(
          onPressed: () {
            printLogger(LoggerType.v, myController.text);
          },
          child: const Text('Logger V', style: TextStyle(fontSize: 30)),
        ),
        TextButton(
          onPressed: () {
            printLogger(LoggerType.d, myController.text);
          },
          child: const Text('Logger D', style: TextStyle(fontSize: 30)),
        ),
        TextButton(
          onPressed: () {
            printLogger(LoggerType.i, myController.text);
          },
          child: const Text('Logger I', style: TextStyle(fontSize: 30)),
        ),
        TextButton(
          onPressed: () {
            printLogger(LoggerType.w, myController.text);
          },
          child: const Text('Logger W', style: TextStyle(fontSize: 30)),
        ),
        TextButton(
          onPressed: () {
            printLogger(LoggerType.e, myController.text);
          },
          child: const Text('Logger E', style: TextStyle(fontSize: 30)),
        ),
        TextButton(
          onPressed: () {
            printLogger(LoggerType.wtf, myController.text);
          },
          child: const Text('Logger WTF', style: TextStyle(fontSize: 30)),
        ),
      ]),
    );
  }
}
