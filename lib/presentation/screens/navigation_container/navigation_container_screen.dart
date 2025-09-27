import 'package:expense_tracker_lite/core/constants.dart';
import 'package:expense_tracker_lite/core/enums/expense_filter.dart';
import 'package:expense_tracker_lite/di/di.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/expenses/expenses_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/summary/summary_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/navigation_container/widgets/navigation_container_content.dart';
import 'package:expense_tracker_lite/presentation/screens/profile/bloc/exchange_rates_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_config_bloc.dart';

class NavigationContainerScreen extends StatelessWidget {
  const NavigationContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di<AppConfigBloc>()),
        BlocProvider(
          create: (context) => di<ExchangeRatesBloc>()
            ..add(ExchangeRatesForTodayFetched(baseCurrency: kBaseCurrency)),
        ),

        BlocProvider(
          create: (_) =>
              di<ExpensesBloc>()
                ..add(ExpensesFetched(filter: ExpenseFilter.monthly)),
        ),
        BlocProvider(
          create: (context) => di<SummaryBloc>()..add(SummaryFetched()),
        ),
      ],
      child: NavigationContainerContent(),
    );
  }
}
