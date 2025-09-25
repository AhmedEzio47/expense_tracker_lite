import 'package:expense_tracker_lite/data/repos/expenses/expenses_repo.dart';
import 'package:expense_tracker_lite/data/repos/expenses/expenses_repo_impl.dart';

import 'di.dart';

void injectRepos() {
  di.registerFactory<ExpensesRepo>(() => ExpensesRepoImpl(database: di()));
}
