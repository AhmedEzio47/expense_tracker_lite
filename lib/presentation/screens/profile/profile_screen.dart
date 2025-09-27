import 'package:expense_tracker_lite/core/constants.dart';
import 'package:expense_tracker_lite/di/di.dart';
import 'package:expense_tracker_lite/presentation/screens/profile/bloc/exchange_rates_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/profile/widgets/profile_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di<ExchangeRatesBloc>()
            ..add(ExchangeRatesForTodayFetched(baseCurrency: kBaseCurrency)),
      child: ProfileContent(),
    );
  }
}
