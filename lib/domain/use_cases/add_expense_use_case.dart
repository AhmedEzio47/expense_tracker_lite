import 'package:expense_tracker_lite/core/custom_types/result.dart';
import 'package:expense_tracker_lite/data/models/expense_model.dart';
import 'package:expense_tracker_lite/data/repos/expenses/expenses_repo.dart';
import 'package:expense_tracker_lite/domain/use_cases/use_case.dart';

class AddExpenseUseCase implements UseCase<void, ExpenseModel> {
  const AddExpenseUseCase(this.repo);

  final ExpensesRepo repo;

  @override
  Result<void> call(ExpenseModel params) => repo.addExpense(params);
}
