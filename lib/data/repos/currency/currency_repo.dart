import 'package:expense_tracker_lite/core/custom_types/result.dart';
import 'package:expense_tracker_lite/data/models/exchange_rates_model.dart';

abstract interface class CurrencyRepo {
  Result<ExchangeRatesModel> getExchangeRates({
    required String base,
    required String date,
  });
}
