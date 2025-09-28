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

  CurrencyConverter converter({bool listenable = true}) {
    final currency =
        (listenable ? watch : read)<AppConfigBloc>().state.selectedCurrency;
    final rate = (listenable ? watch : read)<ExchangeRatesBloc>().state
        .todayRate(currency);
    return CurrencyConverter(selectedCurrency: currency, rate: rate);
  }
}

class CurrencyConverter {
  final String selectedCurrency;
  final num? rate;

  CurrencyConverter({required this.selectedCurrency, required this.rate});

  String convertedAmount(double amount) {
    final effectiveRate = rate ?? 1;
    final converted = amount * effectiveRate;
    return '${getSelectedCurrencySymbol()} ${converted.toMaxTwoDecimals()}';
  }

  String getSelectedCurrencySymbol() {
    return NumberFormat.simpleCurrency(name: selectedCurrency).currencySymbol;
  }

  double amountInBaseCurrency(double amount) {
    final effectiveRate = rate ?? 1;
    return amount / effectiveRate;
  }
}
