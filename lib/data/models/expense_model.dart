class ExpenseModel {
  final String? id;
  final double amount;
  final DateTime date;
  final int categoryId;
  final String? receiptFilePath;
  final DateTime? createdAt;

  const ExpenseModel({
    this.id,
    required this.amount,
    required this.date,
    required this.categoryId,
    this.receiptFilePath,
    this.createdAt,
  });
}
