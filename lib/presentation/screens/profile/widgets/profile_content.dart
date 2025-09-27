import 'package:country_flags/country_flags.dart';
import 'package:expense_tracker_lite/core/constants.dart';
import 'package:expense_tracker_lite/data/models/exchange_rate_model.dart';
import 'package:expense_tracker_lite/presentation/screens/profile/bloc/exchange_rates_bloc.dart';
import 'package:expense_tracker_lite/presentation/widgets/base_bloc_consumer.dart';
import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: BaseBlocConsumer<ExchangeRatesBloc, ExchangeRatesState>(
            onSuccess: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Selected Currency",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<ExchangeRateModel>(
                      initialValue: state.todayExchangeRate?.rates?.firstWhere(
                        (e) => e.targetCurrency == kBaseCurrency,
                      ),
                      items: state.todayExchangeRate?.rates?.map((rate) {
                        return DropdownMenuItem(
                          value: rate,
                          child: Row(
                            spacing: 8,
                            children: [
                              CountryFlag.fromCurrencyCode(
                                rate.targetCurrency ?? '',
                                theme: ImageTheme(
                                  shape: Circle(),
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                              Text(rate.targetCurrency ?? ''),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
