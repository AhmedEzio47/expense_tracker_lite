import 'package:expense_tracker_lite/presentation/screens/add_expense/bloc/add_expense_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/expenses/expenses_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/summary/summary_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/navigation_container/bloc/app_config_bloc.dart';

import 'di.dart';

void injectBlocs() {
  di.registerFactory(() => AddExpenseBloc(di()));
  di.registerFactory(() => ExpensesBloc(di()));
  di.registerFactory(() => SummaryBloc(di()));
  di.registerFactory(() => AppConfigBloc());
}
