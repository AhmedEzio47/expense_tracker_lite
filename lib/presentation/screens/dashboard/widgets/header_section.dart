import 'package:expense_tracker_lite/core/constants.dart';
import 'package:expense_tracker_lite/core/enums/expense_filter.dart';
import 'package:expense_tracker_lite/core/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/expenses/expenses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'balance_card.dart';

class HeaderSection extends HookWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedFilter = useState(ExpenseFilter.monthly);
    return SizedBox(
      height: context.shouldShowBalanceCard
          ? MediaQuery.of(context).size.height * 0.43
          : null,
      child: Stack(
        children: [
          Container(
            height: context.shouldShowBalanceCard
                ? MediaQuery.of(context).size.height * 0.35
                : null,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _WelcomeMessage(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<ExpenseFilter>(
                        value: selectedFilter.value,
                        padding: EdgeInsets.all(5),
                        isDense: true,
                        dropdownColor: Colors.white,
                        underline: const SizedBox(),
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black,
                        ),
                        style: const TextStyle(color: Colors.black),
                        items: ExpenseFilter.values.map((filter) {
                          return DropdownMenuItem(
                            value: filter,
                            child: Text(
                              filter.label,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            selectedFilter.value = value;
                            context.read<ExpensesBloc>().add(
                              ExpensesRefreshed(filter: selectedFilter.value),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (context.shouldShowBalanceCard)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.17,
              child: const Align(
                alignment: Alignment.bottomCenter,
                child: BalanceCard(),
              ),
            ),
        ],
      ),
    );
  }
}

class _WelcomeMessage extends StatelessWidget {
  const _WelcomeMessage();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.person, color: Colors.blue),
        ),
        SizedBox(width: 12),
        Column(
          spacing: 5,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Good Morning",
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              kUserName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
