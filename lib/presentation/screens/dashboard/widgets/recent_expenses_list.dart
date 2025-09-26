import 'package:expense_tracker_lite/core/extensions/date_formatting.dart';
import 'package:expense_tracker_lite/data/models/expense_model.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/expenses_bloc.dart';
import 'package:expense_tracker_lite/presentation/widgets/base_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bouncing_arrow.dart';

class RecentExpensesList extends StatelessWidget {
  const RecentExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseBlocConsumer<ExpensesBloc, ExpensesState>(
      onSuccess: (context, state) {
        final data = state.isListExpanded
            ? state.expenses
            : state.expenses.take(4).toList();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (!state.isListExpanded) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Expenses",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () => context.read<ExpensesBloc>().add(
                        ExpensesListToggled(),
                      ),
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
              ] else
                BouncingArrow(),

              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) =>
                      _ExpenseItem(expense: data[index]),
                  itemCount: data.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ExpenseItem extends StatelessWidget {
  final ExpenseModel expense;

  const _ExpenseItem({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(expense.category.icon, color: Colors.blue),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.category.name,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Manually",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${expense.isIncome ? '+' : '-'} \$ ${expense.amount}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                expense.date.formattedYMD,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
