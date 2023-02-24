import 'dart:async';
import 'package:flutter/material.dart';
import 'package:newsapp/views/GetStarted.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const GetStarted()
            )
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("assets/img/icon_splash_screen.png"),
          Text("Final Project Flutter"),
          CircularProgressIndicator()
        ],
      )
    );
  }
}
