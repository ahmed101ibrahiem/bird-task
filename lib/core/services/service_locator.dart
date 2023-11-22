

import 'package:bird_task/core/services/network_service.dart';
import 'package:bird_task/view_model/cubit/login_cubit.dart';
import 'package:bird_task/view_model/datasources/local/local_datasource.dart';
import 'package:bird_task/view_model/datasources/remote/remote_datasource.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init()async{
  // bloc
   sl.registerFactory<LoginCubit>(() => LoginCubit(remoteDataSource:sl() ,tokenLocalDataSource: sl()));
   /// DATA SOURCE
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(sl()));
   sl.registerLazySingleton<TokenLocalDataSource>(() => TokenLocalDataSourceImpl(sharedPreferences: sl()));
   sl.registerLazySingleton<NetworkService>(() => NetworkServiceImpl(dio: sl()));

   /// external
   final sharedPreferences = await SharedPreferences.getInstance();
   sl.registerLazySingleton(() => sharedPreferences);
   sl.registerLazySingleton(() => Dio());
}
