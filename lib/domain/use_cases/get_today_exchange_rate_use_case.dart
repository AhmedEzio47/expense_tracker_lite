import 'package:dartz/dartz.dart';
import 'package:expense_tracker_lite/core/custom_types/result.dart';
import 'package:expense_tracker_lite/core/extensions/date_formatting.dart';
import 'package:expense_tracker_lite/data/models/exchange_rates_model.dart';
import 'package:expense_tracker_lite/data/repos/currency/currency_repo.dart';

import 'parameters/exchange_rates_params.dart';
import 'use_case.dart';

class GetTodayExchangeRateUseCase
    implements UseCase<ExchangeRatesModel, ExchangeRatesParams> {
  const GetTodayExchangeRateUseCase(this.repo);

  final CurrencyRepo repo;

  @override
  Result<ExchangeRatesModel> call(ExchangeRatesParams params) async {
    final result = await repo.getExchangeRates(
      base: params.baseCurrency,
      date: DateTime.now().subtract(Duration(hours: 6)).formattedYMD,
    );
    return result.fold((l) => Left(l), (r) {
      return Right(r);
    });
  }
}
