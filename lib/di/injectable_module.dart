import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:jui_builder/src/domain/services/local_data_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class InjectableModule {
  @lazySingleton
  Dio get dioClient => Dio();

  @lazySingleton
  LocalDataSourceService get localDataSourceService =>
      LocalDataSourceService(SharedPreferences.getInstance());

  @lazySingleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
