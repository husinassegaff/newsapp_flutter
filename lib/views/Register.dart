import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'GetStarted.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  registerSubmit() async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: _emailController.text.toString().trim(),
          password: _passwordController.text
      );

      // if register success, redirect to login page

      Get.offAll(() => Login());
    } catch(e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Register failed"))
      );
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
              child: Text("Daftar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            ),
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10, left: 20),
              child: Text("Silakan untuk membuat akun!", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
            ),
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
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Konfirmasi Password"
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 35),
            child:  ElevatedButton(
              onPressed: (){
                if(_passwordController.text == _confirmPasswordController.text && _passwordController.text.isNotEmpty && _confirmPasswordController.text.isNotEmpty && _emailController.text.isNotEmpty) {
                  registerSubmit();
                } else if(_passwordController.text.isEmpty || _confirmPasswordController.text.isEmpty || _emailController.text.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Email atau Password tidak boleh kosong"))
                  );
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Password tidak sama"))
                  );
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
              child: const Text("Daftar"),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Sudah punya akun?"),
                TextButton(
                  onPressed: (){
                    Route route = MaterialPageRoute(builder: (context) => const Login());
                    Navigator.push(context, route);
                  },
                  child: const Text("Masuk", style: TextStyle(color: Color(0xFF1F99CC)),
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
