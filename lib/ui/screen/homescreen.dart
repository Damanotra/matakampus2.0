import 'package:flutter/material.dart';
import 'package:matakampus2/ui/screen/percakapantab.dart';
import 'package:matakampus2/ui/screen/profiltab.dart';
import 'package:matakampus2/ui/screen/temuantab.dart';
import 'package:matakampus2/ui/screen/berandatab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    BerandaTab(),
    TemuanTab(),
    PercakapanTab(),
    ProfilTab()
  ];

  @override
  void dispose() {
    super.dispose();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        key: Key("BottomNavigationHomeScreen"),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Beranda'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            title: Text('Temuan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text('Percakapan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profil'),
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
      ),
    );
  }
}