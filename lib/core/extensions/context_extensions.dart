import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/expenses/expenses_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/summary/summary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension DashboardExpensesList on BuildContext {
  bool get shouldShowBalanceCard {
    return !select((ExpensesBloc bloc) => bloc.state.isListExpanded) &&
        select((SummaryBloc bloc) => bloc.state.totalExpenses != null);
  }
}
