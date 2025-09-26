import 'package:expense_tracker_lite/core/enums/expense_filter.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/add_expense_screen.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/expenses/expenses_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/summary/summary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'header_section.dart';
import 'recent_expenses_list.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HeaderSection(),
          Expanded(child: RecentExpensesList()),
        ],
      ),
      bottomNavigationBar: const _BottomNavBar(),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home_rounded,
              size: 40,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.bar_chart_outlined, size: 40),
            onPressed: null,
          ),
          FloatingActionButton(
            heroTag: 'add_expense',
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddExpenseScreen(),
                ),
              ).whenComplete(() {
                context.read<ExpensesBloc>().add(
                  ExpensesRefreshed(filter: ExpenseFilter.monthly),
                );

                context.read<SummaryBloc>().add(SummaryFetched());
              });
            },
            elevation: 0,
            shape: const CircleBorder(
              side: BorderSide(color: Colors.white, width: 0),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              size: 30,
            ),
          ), // space for FAB
          IconButton(
            icon: Icon(Icons.wallet_outlined, size: 40),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.person_outline, size: 40),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
