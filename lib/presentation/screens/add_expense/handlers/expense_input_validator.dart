import 'package:expense_tracker_lite/core/enums/category.dart';

mixin ExpenseInputValidator {
  String? validateExpense({
    required String amountText,
    Category? category,
    DateTime? date,
  }) {
    if (category == null) {
      return "Please select a category";
    }
    if (amountText.isEmpty) {
      return "Please enter an amount";
    }
    if (double.tryParse(amountText) == null) {
      return "Amount must be a valid number";
    }
    if (date == null) {
      return "Please select a date";
    }
    return null; // valid
  }
}
