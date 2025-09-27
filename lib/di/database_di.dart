import 'package:expense_tracker_lite/data/database/database.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di.dart';

Future<void> injectDatabase() async {
  di.registerSingleton<AppDatabase>(AppDatabase());
  di.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}
