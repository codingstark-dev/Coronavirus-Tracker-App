import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:coronatracker/http/fetch_api.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void serviceLocator() async {
  sl.registerLazySingleton(() => Country());
  sl.registerLazySingleton(() => AllCountry());
  sl.registerLazySingleton(() => ApiData());
}
