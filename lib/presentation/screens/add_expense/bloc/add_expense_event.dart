part of 'add_expense_bloc.dart';

sealed class AddExpenseEvent {
  const AddExpenseEvent();
}

final class ExpenseSubmitted extends AddExpenseEvent {
  const ExpenseSubmitted({
    required this.amount,
    required this.category,
    required this.date,
    this.receiptImagePath,
  });

  final double amount;
  final Category category;
  final DateTime date;
  final String? receiptImagePath;
}

final class CategorySelected extends AddExpenseEvent {
  const CategorySelected(this.category);

  final Category category;
}
