import 'package:dartz/dartz.dart';
import 'package:drift/drift.dart';
import 'package:expense_tracker_lite/core/constants.dart';
import 'package:expense_tracker_lite/core/custom_types/app_exception.dart';
import 'package:expense_tracker_lite/core/custom_types/result.dart';
import 'package:expense_tracker_lite/core/enums/expense_filter.dart';
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
              categoryId: expense.category.id,
              receiptFilePath: Value(expense.receiptFilePath),
              isIncome: expense.isIncome,
            ),
          );
      return Right(null);
    } catch (ex) {
      return Left(AppException.fromException(ex));
    }
  }

  @override
  Result<List<ExpenseModel>> getExpenses(int page, ExpenseFilter filter) async {
    try {
      final query = database.expensesTable.select();
      switch (filter) {
        case ExpenseFilter.monthly:
          query.where((e) => e.date.month.equals(DateTime.now().month));
        case ExpenseFilter.weekly:
          query.where(
            (e) => e.date.isBiggerOrEqualValue(
              DateTime.now().subtract(Duration(days: 7)),
            ),
          );
      }

      query.limit(kPerPage, offset: kPerPage * (page - 1));
      query.orderBy([
        (e) => OrderingTerm(expression: e.date, mode: OrderingMode.desc),
      ]);
      final result = await query.get();
      final expenses = result
          .map((e) => ExpenseModel.fromTableData(e))
          .toList();
      return Right(expenses);
    } catch (ex) {
      return Left(AppException.fromException(ex));
    }
  }

  @override
  Result<double> getTotalExpenses() async {
    try {
      final query = database.expensesTable.selectOnly()
        ..addColumns([database.expensesTable.amount])
        ..where(database.expensesTable.isIncome.equals(false));
      final result = await query.get();
      final total = result.fold<double>(
        0.0,
        (sum, row) => sum + (row.read(database.expensesTable.amount) ?? 0.0),
      );
      return Right(total);
    } catch (ex) {
      return Left(AppException.fromException(ex));
    }
  }

  @override
  Result<double> getTotalIncome() async {
    try {
      final query = database.expensesTable.selectOnly()
        ..addColumns([database.expensesTable.amount])
        ..where(database.expensesTable.isIncome.equals(true));
      final result = await query.get();
      final total = result.fold<double>(
        0.0,
        (sum, row) => sum + (row.read(database.expensesTable.amount) ?? 0.0),
      );
      return Right(total);
    } catch (ex) {
      return Left(AppException.fromException(ex));
    }
  }
}
