import 'package:expense_tracker_lite/core/enums/expense_filter.dart';
import 'package:expense_tracker_lite/di/di.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/summary/summary_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/dashboard/widgets/dashboard_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/expenses/expenses_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              di<ExpensesBloc>()
                ..add(ExpensesFetched(filter: ExpenseFilter.monthly)),
        ),
        BlocProvider(
          create: (context) => di<SummaryBloc>()..add(SummaryFetched()),
        ),
      ],
      child: DashboardContent(),
    );
  }
}
