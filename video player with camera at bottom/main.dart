import 'package:flutter/material.dart';
import 'package:video_demo/auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:video_demo/cam.dart';

import './home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      // ignore: deprecated_member_use
      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            if (userSnapshot.hasData) {
              return new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Positioned(
                    child: HomePage(),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(width: 150, height: 150, child: MyCam()))
                ],
              );
            } else
              return AuthScreen();
          }),
    );
  }
}
