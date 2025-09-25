import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:expense_tracker_lite/core/custom_types/app_exception.dart';
import 'package:expense_tracker_lite/core/custom_types/result.dart';
import 'package:expense_tracker_lite/data/database/database.dart';
import 'package:expense_tracker_lite/data/models/expense_model.dart';
import 'package:expense_tracker_lite/data/repos/expenses/expenses_repo.dart';

class ExpensesRepoImpl implements ExpensesRepo {
  const ExpensesRepoImpl({required this.database});

  final AppDatabase database;

  @override
  Result<void> addExpense(ExpenseModel expense) async {
    try {
      await database
          .into(database.expensesTable)
          .insert(
            ExpensesTableCompanion.insert(
              amount: expense.amount,
              date: expense.date,
              categoryId: expense.categoryId,
              receiptFilePath: Value(expense.receiptFilePath),
            ),
          );
      return Right(null);
    } catch (ex) {
      return Left(AppException.fromException(ex));
    }
  }

  @override
  Result<List<ExpenseModel>> getExpenses() {
    // TODO: implement getExpenses
    throw UnimplementedError();
  }
}
