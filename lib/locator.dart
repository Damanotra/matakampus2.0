import 'package:get_it/get_it.dart';
import 'package:matakampus2/resources/provider/api/firebase_api.dart';
import 'package:matakampus2/resources/provider/api/profil_api.dart';
import 'package:matakampus2/resources/provider/shared_preference.dart';

import 'package:matakampus2/resources/provider/api/auth.dart';
import 'package:matakampus2/services/auth_service.dart';
import 'package:matakampus2/resources/provider/api/temuan_api.dart';
import 'package:matakampus2/services/barang_service.dart';
import 'package:matakampus2/services/profil_service.dart';
import 'package:matakampus2/services/temuan_service.dart';


GetIt locator = GetIt();

void setupLocator() async {
  final prefs = await Preference.getInstance();
  locator.registerLazySingleton(() => prefs);

  //firebase
  locator.registerLazySingleton(() => FirebaseAPI('barang'));
  locator.registerLazySingleton(() => BarangService());

  // Repository
  locator.registerLazySingleton(() => AuthAPI());
  locator.registerLazySingleton(() => TemuanAPI());
  locator.registerLazySingleton(() => ProfilAPI());

  // Service
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => TemuanService());
  locator.registerLazySingleton(() => ProfilService());
  
}
