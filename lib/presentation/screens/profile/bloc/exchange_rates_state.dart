part of 'exchange_rates_bloc.dart';

final class ExchangeRatesState extends BaseState {
  const ExchangeRatesState({
    super.status = Status.initial,
    super.failure,
    this.rates,
    this.todayExchangeRate,
    this.baseCurrency,
    this.targetCurrency,
  });

  final List<ExchangeRateEntity>? rates;
  final ExchangeRatesModel? todayExchangeRate;
  final String? baseCurrency;
  final String? targetCurrency;

  num? todayRate(String targetCurrency) => todayExchangeRate?.rates
      ?.firstWhere((e) => e.targetCurrency == targetCurrency)
      .rate;
}
