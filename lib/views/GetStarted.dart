import 'package:flutter/material.dart';
import 'package:newsapp/views/Register.dart';

import 'Login.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image.asset("assets/img/icon_splash_screen.png", width: 140),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child:  ElevatedButton(
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (context) => const Login());
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
                  padding: EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: (){
                      Route route = MaterialPageRoute(builder: (context) => const Register());
                      Navigator.push(context, route);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color(0xFF1F99CC),
                      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      backgroundColor: const Color(0xFFFFFFFF),
                      side: const BorderSide(color: Color(0xFF1F99CC), width: 2),
                      padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("Daftar"),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, left: 30, right: 30),
                  child:   Text(
                    "Dengan mendaftar, saya menyetujui Syarat dan Ketentuan serta Kebijakan Privasi",
                    style: TextStyle(fontSize: 12, color: Color(0xFF424242), fontWeight: FontWeight.w400),
                  ),
                ),

              ],
            )
        )
    );
  }
}
