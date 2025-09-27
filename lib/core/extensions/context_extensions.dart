import 'package:expense_tracker_lite/core/extensions/num_formatting.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/expenses/expenses_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/summary/summary_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/navigation_container/bloc/app_config_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/profile/bloc/exchange_rates_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

extension DashboardExpensesList on BuildContext {
  bool get shouldShowBalanceCard {
    return !select((ExpensesBloc bloc) => bloc.state.isListExpanded) &&
        select((SummaryBloc bloc) => bloc.state.totalExpenses != null);
  }

  String convertedAmount(double amount) {
    final selectedCurrency = read<AppConfigBloc>().state.selectedCurrency;
    final rate = read<ExchangeRatesBloc>().state.todayRate(selectedCurrency);

    return '${_getCurrencySymbol(selectedCurrency)} ${(amount * (rate ?? 1)).toMaxTwoDecimals()}';
  }
}

String _getCurrencySymbol(String currencyCode) {
  return NumberFormat.simpleCurrency(name: currencyCode).currencySymbol;
}
