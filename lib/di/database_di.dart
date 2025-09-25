import 'package:expense_tracker_lite/data/database/database.dart';

import 'di.dart';

void injectDatabase() {
  di.registerSingleton<AppDatabase>(AppDatabase());
}
