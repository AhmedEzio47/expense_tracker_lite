import 'package:expense_tracker_lite/data/models/exchange_rate_model.dart';

class ExchangeRateEntity {
  const ExchangeRateEntity({this.rate, this.dateTime, this.targetCurrency});

  final String? targetCurrency;
  final num? rate;
  final DateTime? dateTime;

  factory ExchangeRateEntity.fromModel(ExchangeRateModel model) =>
      ExchangeRateEntity(
        targetCurrency: model.targetCurrency,
        rate: model.rate,
        dateTime: DateTime.fromMillisecondsSinceEpoch(model.timestamp! * 1000),
      );
}
