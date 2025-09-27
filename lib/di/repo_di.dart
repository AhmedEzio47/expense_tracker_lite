import 'package:expense_tracker_lite/data/repos/currency/currency_repo.dart';
import 'package:expense_tracker_lite/data/repos/currency/currency_repo_impl.dart';
import 'package:expense_tracker_lite/data/repos/expenses/expenses_repo.dart';
import 'package:expense_tracker_lite/data/repos/expenses/expenses_repo_impl.dart';
import 'package:expense_tracker_lite/data/storage/shared_preferences_repo_impl.dart';
import 'package:expense_tracker_lite/data/storage/storage_repo.dart';

import 'di.dart';

void injectRepos() {
  di.registerLazySingleton<StorageRepo>(() => SharedPreferencesRepoImpl(di()));
  di.registerFactory<ExpensesRepo>(() => ExpensesRepoImpl(database: di()));
  di.registerFactory<CurrencyRepo>(() => CurrencyRepoImpl(di()));
}
