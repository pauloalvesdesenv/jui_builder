import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSourceService {
  final Future<SharedPreferences> sharedPreferences;

  LocalDataSourceService(this.sharedPreferences);

  late SharedPreferences prefs;

  Future<void> add(String key, String value) async {
    final instance = await sharedPreferences;
    await instance.setString(key, value);
  }

  Future<String?> get(String key) async {
    final instance = await sharedPreferences;
    return instance.getString(key);
  }

  Future<bool> delete(String key) async {
    final instance = await sharedPreferences;
    return instance.remove(key);
  }
}
