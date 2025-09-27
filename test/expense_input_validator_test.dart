import 'package:expense_tracker_lite/core/enums/category.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/handlers/expense_input_validator.dart';
import 'package:flutter_test/flutter_test.dart';

class DummyValidator with ExpenseInputValidator {}

void main() {
  final validator = DummyValidator();

  test('returns error if category is null', () {
    final result = validator.validateExpense(
      category: null,
      amountText: "100",
      date: DateTime.now(),
    );
    expect(result, "Please select a category");
  });

  test('returns error if amount is empty', () {
    final result = validator.validateExpense(
      category: Category.groceries,
      amountText: "",
      date: DateTime.now(),
    );
    expect(result, "Please enter an amount");
  });

  test('returns error if date is empty', () {
    final result = validator.validateExpense(
      category: Category.groceries,
      amountText: "100",
      date: null,
    );
    expect(result, "Please select a date");
  });

  test('returns error if date is in the future', () {
    final result = validator.validateExpense(
      category: Category.groceries,
      amountText: "100",
      date: DateTime.now().add(const Duration(days: 1)),
    );
    expect(result, "You can not select an upcoming date");
  });

  test('returns null when valid', () {
    final result = validator.validateExpense(
      category: Category.groceries,
      amountText: "100",
      date: DateTime.now(),
    );
    expect(result, isNull);
  });
}
