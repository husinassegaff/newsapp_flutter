import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    _user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Halo, ${_user?.email ?? ''}',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Pilih Kategori Berita",
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.only(left: 16.0, right: 16.0),
              children: [
                Padding(padding: EdgeInsets.all(3.0),
                  child: _buildIconButton(context, Icons.article_rounded, 'Berita Utama')
                ),
                Padding(padding: EdgeInsets.all(3.0),
                    child: _buildIconButton(context, Icons.sports_soccer_rounded, 'Berita Olahraga')
                ),
                Padding(padding: EdgeInsets.all(3.0),
                    child: _buildIconButton(context, Icons.gavel_rounded, 'Berita Politik'),
                ),
                Padding(padding: EdgeInsets.all(3.0),
                  child: _buildIconButton(context, Icons.attach_money_rounded, 'Berita Ekonomi'),
                ),
                Padding(padding: EdgeInsets.all(3.0),
                  child: _buildIconButton(context, Icons.computer_rounded, 'Berita Teknologi'),
                ),
                Padding(padding: EdgeInsets.all(3.0),
                  child: _buildIconButton(context, Icons.people_rounded, 'Berita Sosial'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(BuildContext context, IconData iconData, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.0,
            blurRadius: 4.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 48.0,
            color: Colors.blueGrey[800],
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blueGrey[800],
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

