import 'package:flutter/material.dart';

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
        leading: const Icon(Icons.arrow_back, color: Colors.black),
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
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color(0xFF424242),
                  textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  backgroundColor: const Color(0xFFFFFFFF),
                  side: const BorderSide(color: Color(0x0fffffff), width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text("Sign In with Google")
            ),
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
                  onPressed: (){},
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
