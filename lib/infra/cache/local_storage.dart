abstract class LocalStorage {
  Future<List<String>> getAll();
  Future<void> setStorage(List<String> value);
}
