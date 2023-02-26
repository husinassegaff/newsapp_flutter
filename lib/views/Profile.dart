import 'package:newsapp/views/Login.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://avatars.githubusercontent.com/u/63222585?s=400&u=57318467d55abbb182de6237b6ca4059c0f0d82f&v=4"),
            ),
            SizedBox(height: 16),
            const Text(
              "Husin Assegaff",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {
                launch("https://github.com/husinassegaff");
            },
              icon: Icon(Icons.code),
              label: const Text("GitHub: husinassegaff"),
            ),
            SizedBox(height: 8),
            TextButton.icon(
              onPressed: () {
                launch("https://www.instagram.com/husinassegaff");
              },
              icon: Icon(Icons.photo),
              label: Text("Instagram: husinassegaff"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child:  ElevatedButton(
                onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Login()
                      ),
                      (Route<dynamic> route) => false
                  );
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
                child: const Text("Logout"),
              ),
            ),
          ],
        )
      )
    );
  }
}
