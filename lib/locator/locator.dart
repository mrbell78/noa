import 'package:get_it/get_it.dart';
import 'package:noa/Home/home-repository.dart';
import 'package:noa/http-service/http-service.dart';
import 'package:noa/login-registration/login-repository.dart';
import 'package:noa/product/product-repository.dart';
import 'package:noa/profile/profile-repository.dart';
import 'package:noa/service/service-repository.dart';
import 'package:noa/truck-details/truck-repository.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {

  locator.registerLazySingleton<HttpService>(() => HttpService());
  locator.registerLazySingleton<LoginRepository>(() => LoginRepository());
  locator.registerLazySingleton<TruckRepository>(() => TruckRepository());
  locator.registerLazySingleton<HomeRepository>(() => HomeRepository());
  locator.registerLazySingleton<ProductRepository>(() => ProductRepository());
  locator.registerLazySingleton<ProfileRepository>(() => ProfileRepository());
  locator.registerLazySingleton<ServiceRepository>(() => ServiceRepository());


}