import 'local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageSharedPreferenceAdapter implements LocalStorage {
  final String _key = 'informations';

  @override
  Future<List<String>> getAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  @override
  Future<void> setStorage(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_key, value);
  }
}
