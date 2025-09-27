import 'package:expense_tracker_lite/core/enums/expense_filter.dart';
import 'package:expense_tracker_lite/core/enums/navigation_tab.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/add_expense_screen.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/expenses/expenses_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/summary/summary_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/navigation_container/bloc/app_config_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigBloc, AppConfigState>(
      builder: (context, state) {
        return BottomAppBar(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavigationTab.home.tab(
                state.selectedTab == NavigationTab.home,
                context,
              ),
              NavigationTab.analytics.tab(
                state.selectedTab == NavigationTab.analytics,
                context,
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
              NavigationTab.wallet.tab(
                state.selectedTab == NavigationTab.wallet,
                context,
              ),
              NavigationTab.profile.tab(
                state.selectedTab == NavigationTab.profile,
                context,
              ),
            ],
          ),
        );
      },
    );
  }
}
