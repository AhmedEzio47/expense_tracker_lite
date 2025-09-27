import 'package:expense_tracker_lite/data/storage/storage_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class SharedPreferencesRepoImpl implements StorageRepo {
  final SharedPreferences sharedPrefs;

  SharedPreferencesRepoImpl(this.sharedPrefs);

  @override
  Future<void> delete(String key) {
    sharedPrefs.remove(key);

    return Future.value();
  }

  @override
  Future<void> deleteAll() {
    sharedPrefs.clear();

    return Future.value();
  }

  @override
  Future<String?> read(String key) {
    final value = sharedPrefs.getString(key);

    return Future.value(value);
  }

  @override
  Future<void> write({required String key, required String value}) {
    sharedPrefs.setString(key, value);

    return Future.value();
  }

  @override
  Future<void> clear() async {
    await sharedPrefs.clear();
  }
}
