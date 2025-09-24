import 'package:expense_tracker_lite/presentation/screens/add_expense/add_expense_screen.dart';
import 'package:flutter/material.dart';

import 'widgets/header_section.dart';
import 'widgets/recent_expenses_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          const HeaderSection(),
          const SizedBox(height: 16),
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
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddExpenseScreen(),
                ),
              );
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
