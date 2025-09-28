import 'package:expense_tracker_lite/core/custom_types/result.dart';
import 'package:expense_tracker_lite/core/enums/expense_filter.dart';
import 'package:expense_tracker_lite/data/models/expense_model.dart';
import 'package:expense_tracker_lite/data/repos/expenses/expenses_repo.dart';
import 'package:expense_tracker_lite/domain/use_cases/use_case.dart';

class GetExpensesUseCase
    implements UseCase<(List<ExpenseModel>, int), GetExpensesParams> {
  const GetExpensesUseCase(this.repo);

  final ExpensesRepo repo;

  @override
  Result<(List<ExpenseModel>, int)> call(GetExpensesParams params) =>
      repo.getExpenses(params.page, params.filter);
}

class GetExpensesParams {
  const GetExpensesParams({required this.page, required this.filter});

  final int page;
  final ExpenseFilter filter;
}
