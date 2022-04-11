import 'dart:async';
import 'dart:math';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:library_test/fbroadcast/broadcast_keys.dart';
import 'package:library_test/fbroadcast/login_page.dart';
import 'package:library_test/fbroadcast/user.dart';
// import 'package:fbutton/fbutton.dart';
import 'package:flutter/material.dart';
// import 'package:fsuper/fsuper.dart';

// ignore: camel_case_types
FBroadcast? fBroadcast()=> null;

class PageDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        fBroadcast()!.broadcast(Key_StopCount);
        return Future.value(true);
      },
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              // FSuper(
              //   width: double.infinity,
              //   height: 250.0,
              //   gradient: LinearGradient(colors: [
              //     Color(0xffe1eec3),
              //     Color(0xfff05053),
              //   ]),
              // ),
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).viewPadding.top),
                height: 48,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color:  Colors.blueGrey),
                  onPressed: () {
                    fBroadcast()!.broadcast(Key_StopCount);
                    Navigator.pop(context);
                  },
                ),
              ),
              // FSuper(
              //   width: double.infinity,
              //   height: double.infinity,
              //   margin: EdgeInsets.only(top: 230),
              //   backgroundColor: Colors.white,
              //   shadowColor:  Colors.grey,
              //   shadowBlur: 10.0,
              //   corner: FCorner(leftTopCorner: 22, rightTopCorner: 22),
              //
              //   /// avatar
              //   child1: Avatar(),
              //   child1Alignment: Alignment.topCenter,
              //   child1Margin: EdgeInsets.only(bottom: 35),
              //   child2: Container(
              //     width: MediaQuery.of(context).size.width,
              //     height: MediaQuery.of(context).size.height - 230 - 12,
              //     clipBehavior: Clip.none,
              //     child: SingleChildScrollView(
              //       physics: BouncingScrollPhysics(),
              //       child: Container(
              //         padding: EdgeInsets.only(left: 12, right: 12),
              //         child: Column(
              //           children: <Widget>[
              //             /// init
              //             Stateful(initState: (setState, data) {
              //               /// register Key_User reviver
              //               fBroadcast()!.register(
              //                 Key_User,
              //
              //                 /// refresh ui
              //                 (value, _) => setState(() {}),
              //
              //                 /// bind context
              //                 context: data,
              //               );
              //             }, builder: (context, setState, data) {
              //               return FSuper(
              //                 padding: EdgeInsets.only(left: 12, right: 12),
              //                 margin: EdgeInsets.only(bottom: 15),
              //
              //                 /// get Key_User value to show
              //                 text:
              //                     "${FBroadcast.value<User>(Key_User)?.info ?? ""}",
              //                 style: TextStyle(
              //                   color:  Colors.white,
              //                   fontSize: 11,
              //                 ),
              //               );
              //             }),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: <Widget>[
              //                 Stateful(
              //                   /// init
              //                   initState: (setState, data) {
              //                     /// register
              //                     fBroadcast()!.register(
              //                       Key_Color,
              //                       (value, _) {
              //                         /// refresh ui
              //                         setState(() {});
              //                       },
              //
              //                       /// bind context
              //                       context: data,
              //                     );
              //                   },
              //                   builder: (context, setState, data) {
              //                     return FSuper(
              //                       width: 200,
              //                       height: 100,
              //                       backgroundColor:
              //
              //                           /// get color value
              //                           FBroadcast.value<Color>(Key_Color) ??
              //                               Colors.blue,
              //                       corner: FCorner.all(6.0),
              //                     );
              //                   },
              //                 ),
              //                 FButton(
              //                   width: 150,
              //                   height: 100,
              //                   color:  Colors.blue,
              //                   corner: FCorner.all(6.0),
              //                   text: "Change Color",
              //                   style: TextStyle(
              //                       color:  Colors.white, fontSize: 16),
              //                   alignment: Alignment.center,
              //                   clickEffect: true,
              //                   shadowColor:  Colors.grey,
              //                   onPressed: () {
              //                     /// send change color message
              //                     fBroadcast()!.broadcast(Key_Color,
              //                         value: reduceColor());
              //                   },
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(height: 16),
              //             FSuper(
              //               width: double.infinity,
              //               height: 100,
              //               backgroundColor:  Colors.blue,
              //               corner: FCorner.all(6.0),
              //               onClick: () {},
              //             ),
              //             const SizedBox(height: 16),
              //             FSuper(
              //               width: double.infinity,
              //               height: 100,
              //               backgroundColor:  Colors.blue,
              //               corner: FCorner.all(6.0),
              //             ),
              //             const SizedBox(height: 16),
              //             FSuper(
              //               width: double.infinity,
              //               height: 100,
              //               backgroundColor:  Colors.blue,
              //               corner: FCorner.all(6.0),
              //             ),
              //             const SizedBox(height: 200),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              //   child2Alignment: Alignment.topLeft,
              //   child2Margin: EdgeInsets.only(top: 70),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Color reduceColor() {
    return [
      Colors.red,
      Colors.blue,
      Colors.amber,
      Colors.cyan
    ][Random.secure().nextInt(4)];
  }
}

class Avatar extends StatefulWidget {
  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  void initState() {
    super.initState();
    fBroadcast()!.register(
      Key_MsgCount,

      /// register Key_MsgCount reviver
      (value, _) => setState(() {}),
      more: {
        /// register Key_User reviver
        Key_User: (value, _) => setState(() {}),
      },

      /// bind context
      context: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    /// get value from FBroadcast
    User user = FBroadcast.value<User>(Key_User);
    int msgCount = FBroadcast.value(Key_MsgCount) ?? 0;
    return Center(
      child: Text("Click Login"

      )
    );
    // return FSuper(
    //   width: 90,
    //   height: 90,
    //   corner: FCorner.all(50),
    //   backgroundImage: (user == null || _textIsEmpty(user.avatar))
    //       ? null
    //       : AssetImage(user.avatar),
    //   shadowColor:  Colors.grey,
    //   shadowBlur: 10.0,
    //   redPoint: user != null && msgCount > 0,
    //   redPointOffset: Offset(2.0, 2.0),
    //   redPointText: msgCount.toString(),
    //   text: user != null ? null : "Click Login",
    //   textAlignment: Alignment.center,
    //   style: TextStyle(color: Colors.white),
    //   backgroundColor: Colors.blue,
    //   onClick: user != null
    //       ? null
    //       : () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())),
    // );
  }

  @override
  void dispose() {
    super.dispose();
    fBroadcast()!.unregister(this);
  }
}

bool _textIsEmpty(String text) {
  return text == null || text.length == 0;
}
