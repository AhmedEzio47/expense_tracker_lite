import 'package:expense_tracker_lite/core/extensions/context_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('converts amount correctly with rate', () {
    final converter = CurrencyConverter(selectedCurrency: 'EUR', rate: 1.17);
    expect(converter.convertedAmount(10), '€ 11.7'); // assuming USD symbol
  });

  test('the rate is 1 when no rate is found', () {
    final converter = CurrencyConverter(selectedCurrency: 'EGP', rate: null);
    expect(converter.convertedAmount(10), 'E£ 10'); // assuming USD symbol
  });

  test('converts amount to base currency correctly', () {
    final converter = CurrencyConverter(selectedCurrency: 'EUR', rate: 1.17);
    expect(converter.amountInBaseCurrency(11.7), 10);
  });
}
