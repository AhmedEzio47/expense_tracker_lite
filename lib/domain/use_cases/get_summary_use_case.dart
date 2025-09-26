import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/core/custom_types/result.dart';
import 'package:expense_tracker_lite/core/extensions/either_casting.dart';
import 'package:expense_tracker_lite/data/repos/expenses/expenses_repo.dart';
import 'package:expense_tracker_lite/domain/use_cases/use_case.dart';

class GetSummaryUseCase implements UseCase<(double, double), NoParams> {
  const GetSummaryUseCase(this.repo);

  final ExpensesRepo repo;

  @override
  Result<(double, double)> call(NoParams params) async {
    final totalExpenses = await repo.getTotalExpenses();
    final totalIncome = await repo.getTotalIncome();

    if (totalExpenses.isLeft() || totalIncome.isLeft()) {
      return Left(totalExpenses.asLeft());
    }

    return (Right((totalExpenses.asRight(), totalIncome.asRight())));
  }
}
