import 'package:fbroadcast/fbroadcast.dart';
import 'package:library_test/fbroadcast/broadcast_keys.dart';
import 'package:library_test/fbroadcast/handler_login.dart';
import 'package:flutter/material.dart';
FBroadcast? fBroadcast()=> null;
// FLoading? fLoading()=>null;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginHandler handler = LoginHandler();
  var _broadcastTextController1 = TextEditingController();
  var _broadcastTextController2 = TextEditingController();


  @override
  void initState() {
    super.initState();
    _broadcastTextController1.addListener(() {
      handler.userName = _broadcastTextController1.text;
    });
    _broadcastTextController2.addListener(() {
      handler.password = _broadcastTextController2.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color:  Colors.blueGrey),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ),
          body: Container(
            padding: EdgeInsets.only(left: 50, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                      color:  Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: _broadcastTextController1,
                  autofillHints: ["User Name", ""],
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _broadcastTextController2,
                  autofillHints: ["Password", ""],
                ),
                const SizedBox(height: 15),
                Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 11, color: Colors.blueAccent),
                ),
                const SizedBox(height: 25),
                Stateful(
                  initState: (setState, data) {
                    /// register login receiver
                    fBroadcast()!.register(
                      Key_Login,

                      /// refresh ui
                      (value, _) => setState(() {}),
                      more: {
                        /// register user receiver
                        Key_User: (value, _) {
                          // FLoading.hide();
                          Navigator.pop(context);
                        },
                      },

                      /// bind context
                      context: data,
                    );
                  },
                  builder: (context, setState, data) {
                    return TextButton(
                      child: const Text("LOGIN"),
                      style: TextButton.styleFrom(
                          textStyle: TextStyle(color: Colors.white, fontSize: 18),
                          backgroundColor: Colors.blue
                      ),
                      onPressed: !(FBroadcast.value(Key_Login) ?? false)
                          ? null
                          : () {
                        // _controller1.clearFocus();
                        // _controller2.clearFocus();
                        // fLoading()!..show(context);
                        handler.login();
                      },
                    );
                    /*return FButton(
                      width: double.infinity,
                      height: 50,
                      color: Colors.pink,
                      corner: FCorner.all(25),
                      clickEffect: true,
                      shadowBlur: 10.0,
                      shadowColor: Colors.pink[300],
                      text: "LOGIN",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      disableStyle: TextStyle(
                          color: Colors.white.withOpacity(0.7), fontSize: 18),
                      alignment: Alignment.center,
                      highlightColor: Colors.pink,
                      disabledColor: Colors.pink.withOpacity(0.1),

                      /// Key_Login value=true is allowed to click login
                      onPressed: !(FBroadcast.value(Key_Login) ?? false)
                          ? null
                          : () {
                              _controller1.clearFocus();
                              _controller2.clearFocus();
                              FLoading.show(context);
                              handler.login();
                            },
                    );*/
                  },
                ),
                const SizedBox(height: 25),
                // FSuper(
                //   textAlignment: Alignment.center,
                //   text: "Don't have account?",
                //   style: TextStyle(color:  Colors.white, fontSize: 11),
                //   spans: [
                //     TextSpan(
                //         text: " Sign up", style: TextStyle(color: Colors.pink))
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
