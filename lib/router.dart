import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:matakampus2/ui/screen/ditemukan/ditemukan.dart';
import 'package:matakampus2/ui/screen/homescreen.dart';
import 'package:matakampus2/ui/screen/login.dart';
import 'package:matakampus2/ui/screen/splashscreen.dart';


class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_)=>SplashScreen(),
        );
        break;
      case '/login':
        return MaterialPageRoute(
          builder: (_)=>LoginScreen()
        );
        break;
      case '/home':
        return MaterialPageRoute(
          builder: (_)=>HomeScreen()
        );
        break;
      case '/barang-ditemukan':
        return MaterialPageRoute(
          //builder: (_)=>DitemukanScreen()
        );
        break;
      default:
    }
  }
}