import 'dart:async';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:library_test/fbroadcast/broadcast_keys.dart';
FBroadcast? fBroadcast()=> null;

class Runner {
  Runner() {
    /// register
    fBroadcast()!.register(Key_RunnerState, (value, _) {
      if (value is String && value.contains("Run")) {
        /// receive start run message
        fBroadcast()!.broadcast(Key_RunnerState, value: "0m..");
        run(20);
      }
    });
  }

  run(double distance) {
    /// send running message
    Timer(Duration(milliseconds: 500), () {
      fBroadcast()!.broadcast(Key_RunnerState, value: "${distance.toInt()}m..");
      var newDistance = distance + 20;
      if (newDistance > 100) {
        fBroadcast()!.broadcast(Key_RunnerState, value: "Win!\nTotal time is 2.5s");
      } else {
        run(newDistance);
      }
    });
  }
}
