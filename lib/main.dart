import 'package:flutter/material.dart';
import 'package:library_test/undefined_view.dart';
import 'router.dart' as router;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(          // Add the 5 lines from here...
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        )
      ),
      onGenerateRoute: router.generateRoute,
      initialRoute: "/",
      onUnknownRoute: (settings)=> MaterialPageRoute(builder: (context)=> UndefinedView(name :settings.name)),
    );
  }

}
