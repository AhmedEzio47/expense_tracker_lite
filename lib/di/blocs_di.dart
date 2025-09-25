import 'package:expense_tracker_lite/presentation/screens/add_expense/bloc/add_expense_bloc.dart';

import 'di.dart';

void injectBlocs() {
  di.registerFactory(() => AddExpenseBloc(di()));
}
