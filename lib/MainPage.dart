import 'package:flutter/material.dart';
import 'package:library_test/undefined_view.dart';
import 'router.dart' as router;

class MainPageWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: const EdgeInsets.only(top: 80.0),
            child: ListView(
              padding: const EdgeInsets.all(8),
              children: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/permission");
                    },
                    child: (const Text('권한 화면'))),
                TextButton(onPressed: () {}, child: (const Text('권한 화면'))),
                TextButton(onPressed: () {}, child: (const Text('권한 화면'))),
              ],
            )));
  }
}