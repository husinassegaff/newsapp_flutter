import 'package:flutter/material.dart';
import 'package:newsapp/views/GetStarted.dart';
import 'package:newsapp/views/Register.dart';

import 'BottomNavigation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Route route = MaterialPageRoute(builder: (context) => const GetStarted());
            Navigator.push(context, route);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text("Masuk", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text("Gunakan akun yang telah didaftarkan!", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20),
            child:  Image(image: AssetImage("assets/img/icon_splash_screen.png"), width: 140),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 45, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 20, right: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 35),
            child:  ElevatedButton(
              onPressed: (){
                Route route = MaterialPageRoute(builder: (context) => const BottomNavigation());
                Navigator.push(context, route);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                backgroundColor: const Color(0xFF1A3665),
                padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: const Text("Masuk"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Belum punya akun?"),
                TextButton(
                  onPressed: (){
                    Route route = MaterialPageRoute(builder: (context) => const Register());
                    Navigator.push(context, route);
                  },
                  child: const Text("Daftar", style: TextStyle(color: Color(0xFF1F99CC)),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
