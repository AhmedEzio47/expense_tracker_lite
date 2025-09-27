import 'package:expense_tracker_lite/di/blocs_di.dart';
import 'package:expense_tracker_lite/di/database_di.dart';
import 'package:expense_tracker_lite/di/repo_di.dart';
import 'package:expense_tracker_lite/di/use_cases_di.dart';
import 'package:get_it/get_it.dart';

import 'network_di.dart';

GetIt di = GetIt.instance;

Future<void> injectDependencies() async {
  await injectNetworkDependencies();
  await injectDatabase();
  injectRepos();
  injectUseCases();
  injectBlocs();
}
