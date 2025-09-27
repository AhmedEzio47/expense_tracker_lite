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

  String _selectedCurrency({bool listen = true}) =>
      (listen ? watch : read)<AppConfigBloc>().state.selectedCurrency;

  num? _rate({bool listen = true}) =>
      (listen ? watch : read)<ExchangeRatesBloc>().state.todayRate(
        _selectedCurrency(listen: listen),
      );

  String convertedAmount(double amount) {
    return '${getSelectedCurrencySymbol()} ${(amount * (_rate() ?? 1)).toMaxTwoDecimals()}';
  }

  String getSelectedCurrencySymbol() {
    return NumberFormat.simpleCurrency(
      name: _selectedCurrency(),
    ).currencySymbol;
  }

  double amountInBaseCurrency(double amount) {
    return amount / (_rate(listen: false) ?? 1);
  }
}
