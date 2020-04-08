import 'package:coronatracker/Freezed/covid_freezed.dart';
import 'package:coronatracker/http/fetch_api.dart';
import 'package:coronatracker/provider/boolstates.dart';
import 'package:coronatracker/provider/getGlobal.dart';
import 'package:coronatracker/service/analytics_service.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void serviceLocator() async {
  sl.registerLazySingleton(() => Country());
  sl.registerLazySingleton(() => GetGlobal());
  sl.registerLazySingleton(() => ApiData());
  sl.registerLazySingleton(() => DataState());
  sl.registerLazySingleton(() => AnalyticsService());

}
