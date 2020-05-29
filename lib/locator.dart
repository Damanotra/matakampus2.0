import 'package:get_it/get_it.dart';
import 'package:matakampus2/resources/provider/api/firestore_api.dart';
import 'package:matakampus2/services/barang_service.dart';


GetIt locator = GetIt();

void setupLocator() async {
//  final prefs = await Preference.getInstance();
//  locator.registerLazySingleton(() => prefs);

  //firebase
  locator.registerLazySingleton(() => FirestoreAPI('barang'));
  locator.registerLazySingleton(() => BarangService());

  // Repository
//  locator.registerLazySingleton(() => AuthAPI());
//  locator.registerLazySingleton(() => TemuanAPI());
//  locator.registerLazySingleton(() => ProfilAPI());

  // Service
//  locator.registerLazySingleton(() => AuthService());
//  locator.registerLazySingleton(() => TemuanService());
//  locator.registerLazySingleton(() => ProfilService());
  
}
