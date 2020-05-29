import 'package:flutter/material.dart';
import 'package:matakampus2/router.dart';

class MataKampus extends StatefulWidget {
  @override
  _MataKampusState createState() => _MataKampusState();
}

class _MataKampusState extends State<MataKampus> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MataKampus',
      initialRoute: '/',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: MaterialColor(0xFFFF9717,color),
        primaryColor: Color(0xFFFF9717)
      ),
      onGenerateRoute: Router.generateRoute,
    );
  }
}

Map<int, Color> color =
{
50:Color.fromRGBO(100,59,9, .1),
100:Color.fromRGBO(100,59,9, .2),
200:Color.fromRGBO(100,59,9, .3),
300:Color.fromRGBO(100,59,9, .4),
400:Color.fromRGBO(100,59,9, .5),
500:Color.fromRGBO(100,59,9, .6),
600:Color.fromRGBO(100,59,9, .7),
700:Color.fromRGBO(100,59,9, .8),
800:Color.fromRGBO(100,59,9, .9),
900:Color.fromRGBO(100,59,9, 1),
};
