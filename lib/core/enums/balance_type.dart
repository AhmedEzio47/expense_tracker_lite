import 'package:flutter/material.dart';

enum BalanceType {
  income(label: "Income", icon: Icons.arrow_downward),
  expenses(label: "Expenses", icon: Icons.arrow_upward);

  final String label;
  final IconData icon;

  const BalanceType({required this.label, required this.icon});
}
