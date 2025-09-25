import 'package:expense_tracker_lite/di/di.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/widgets/add_expense_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/add_expense_bloc.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AddExpenseBloc>(),
      child: AddExpenseContent(),
    );
  }
}
