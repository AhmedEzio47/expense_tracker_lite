part of 'add_expense_bloc.dart';

sealed class AddExpenseEvent {
  const AddExpenseEvent();
}

final class ExpenseSubmitted extends AddExpenseEvent {
  const ExpenseSubmitted({
    required this.amount,
    required this.categoryId,
    required this.date,
    this.receiptImagePath,
  });

  final double amount;
  final int categoryId;
  final DateTime date;
  final String? receiptImagePath;
}
