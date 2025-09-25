import 'package:expense_tracker_lite/core/custom_types/result.dart';
import 'package:expense_tracker_lite/core/enums/expense_filter.dart';
import 'package:expense_tracker_lite/data/models/expense_model.dart';

abstract interface class ExpensesRepo {
  Result<void> addExpense(ExpenseModel expense);
  Result<List<ExpenseModel>> getExpenses(int page, ExpenseFilter filter);
}
