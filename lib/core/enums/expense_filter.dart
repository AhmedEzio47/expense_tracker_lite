enum ExpenseFilter {
  monthly('This month'),
  weekly('Last 7 days');

  final String label;
  const ExpenseFilter(this.label);
}
