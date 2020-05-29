import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:matakampus2/locator.dart';
import 'package:matakampus2/app.dart';

void main() async {
  // await SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //     DeviceOrientation.portraitDown,
  //   ],
  // );

  await setupLocator();

  runApp(MataKampus());
}
