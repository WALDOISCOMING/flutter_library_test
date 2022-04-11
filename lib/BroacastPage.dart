import 'dart:async';
import 'dart:math';

import 'package:library_test/fbroadcast/broadcast_keys.dart';
import 'package:library_test/fbroadcast/page_demo_1.dart';
import 'package:library_test/fbroadcast/page_demo_2.dart';
import 'package:library_test/fbroadcast/page_demo_3.dart';
import 'package:flutter/material.dart';
import 'package:fbroadcast/fbroadcast.dart';

import 'package:library_test/fbroadcast/location_server.dart';

// void main() {
//   LocationServer();
//   runApp(MyApp());
// }
FBroadcast? fBroadcast()=> null;

class BroadcastHandlerWidget extends StatefulWidget {
  @override
  _BroadcastHandlerWidget createState() => _BroadcastHandlerWidget();
}

class _BroadcastHandlerWidget extends State<BroadcastHandlerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var text = "Run Count And Goto Next";

  @override
  void initState() {
    fBroadcast()!.register(Key_StopCount, (_, __) {
      runAddCount?.cancel();
      setState(() {
        text = "STOP!";
      });
    }, context: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('text = $text');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'FBroadcast',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: const Text("Demo1: Runner"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(color: Colors.white),
                backgroundColor: Colors.blue
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PageDemo1();
                  },
                ));
              },
            ),
            const SizedBox(height: 90),
            TextButton(
              child: const Text("Demo2: User"),
              style: TextButton.styleFrom(
                  textStyle: TextStyle(color: Colors.white),
                  backgroundColor: Colors.blue
              ),
              onPressed: () {
                fBroadcast()!
                    .stickyBroadcast(Key_MsgCount, value: ++msgCount);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PageDemo2();
                  },
                ));
                addCount(context);
              },
            ),
            const SizedBox(height: 90),
            TextButton(
              child: const Text("Demo3: Location"),
              style: TextButton.styleFrom(
                  textStyle: TextStyle(color: Colors.white),
                  backgroundColor: Colors.blue
              ),
              onPressed: () {
                fBroadcast()!
                    .stickyBroadcast(Key_MsgCount, value: ++msgCount);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PageDemo3();
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }

  int msgCount = 0;
  Timer? runAddCount;

  addCount(BuildContext context) {
    runAddCount = Timer(Duration(milliseconds: 1000), () {
      fBroadcast()!.broadcast(Key_MsgCount, value: ++msgCount);
      addCount(context);
    });
  }

  @override
  void dispose() {
    fBroadcast()!.unregister(this);
    super.dispose();
  }
}
