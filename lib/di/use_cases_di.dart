import 'package:expense_tracker_lite/domain/use_cases/add_expense_use_case.dart';

import 'di.dart';

void injectUseCases() {
  di.registerFactory<AddExpenseUseCase>(() => AddExpenseUseCase(di()));
}
