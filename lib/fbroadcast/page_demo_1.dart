import 'package:fbroadcast/fbroadcast.dart';
import 'package:library_test/fbroadcast/broadcast_keys.dart';
import 'package:library_test/fbroadcast/runner.dart';
import 'package:flutter/material.dart';
FBroadcast? fBroadcast()=> null;

class PageDemo1 extends StatelessWidget {
  Runner runner = Runner();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        fBroadcast()!.clear(Key_RunnerState);
        return Future.value(true);
      },
      child: Material(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Stateful(
                /// init
                initState: (setState, data) {
                  fBroadcast()!.register(
                    Key_RunnerState,
                    (value, _) {
                      /// update
                      setState(() {});
                    },

                    /// bind context
                    context: data,
                  );
                },
                builder: (context, setState, data) {
                  return Text(
                    FBroadcast.value(Key_RunnerState) ?? "Preparing..",
                    style: TextStyle(color: Colors.greenAccent, fontSize: 25),
                  );
                  /*return FSuper(
                    width: 280,
                    height: 150,
                    backgroundColor: Colors.grey[800],
                    corner: FCorner.all(6.0),
                    shadowColor:  Colors.blueGrey,
                    shadowBlur: 5.0,
                    shadowOffset: Offset(2.0, 2.0),
                    style: TextStyle(color: Colors.greenAccent, fontSize: 25),
                    textAlignment: Alignment.center,

                    /// get value
                    text: FBroadcast.value(Key_RunnerState) ?? "Preparing..",
                  );*/
                },
              ),
              const SizedBox(height: 100),
              TextButton(
                child: const Text("Start"),
                style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white),
                    backgroundColor: Colors.blue
                ),
                onPressed: () {
                  /// send run message
                  fBroadcast()!
                      .broadcast(Key_RunnerState, value: "Running...");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
