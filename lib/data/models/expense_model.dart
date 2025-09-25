import 'package:expense_tracker_lite/core/enums/category.dart';
import 'package:expense_tracker_lite/data/database/database.dart';

class ExpenseModel {
  final String? id;
  final double amount;
  final DateTime date;
  final Category category;
  final String? receiptFilePath;
  final DateTime? createdAt;
  final bool isIncome;

  const ExpenseModel({
    this.id,
    required this.amount,
    required this.date,
    required this.category,
    required this.isIncome,
    this.receiptFilePath,
    this.createdAt,
  });

  factory ExpenseModel.fromTableData(ExpensesTableData data) => ExpenseModel(
    amount: data.amount,
    date: data.date,
    createdAt: data.createAt,
    receiptFilePath: data.receiptFilePath,
    isIncome: data.isIncome,
    category: Category.values.firstWhere((cat) => cat.id == data.categoryId),
  );
}
