import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:library_test/fbroadcast/broadcast_keys.dart';

FBroadcast? fBroadcast()=> null;
class LocationServer {
  LocationServer() {
    init();
  }

  init() {
    /// register Key_Location receiver
    FBroadcast.instance().register(Key_Location, (value, callback) async {
      var loc = await location();

      /// return message
      callback(loc);
    });
  }

  /// Analog positioning
  Future<List<double>> location() async {
    await Future.delayed(Duration(milliseconds: 2000));
    return [Random().nextDouble() * 280, Random().nextDouble() * 150];
  }
}
