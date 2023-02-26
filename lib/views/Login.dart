import 'package:flutter/material.dart';
import 'package:newsapp/views/GetStarted.dart';
import 'package:newsapp/views/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'BottomNavigation.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  loginSubmit() async {
    try {
      _firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      ).then((value) => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavigation())
      )
      );
    } catch(e) {
      print(e);
      SnackBar(content: Text(e.toString()));
    }
  }

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

          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email"
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password"
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 35),
            child:  ElevatedButton(
              onPressed: (){

                if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Email dan Password tidak boleh kosong"),
                    ),
                  );
                } else {
                  loginSubmit();
                }
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
