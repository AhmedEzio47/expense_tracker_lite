import 'package:expense_tracker_lite/data/models/exchange_rates_model.dart';
import 'package:expense_tracker_lite/domain/entities/exchange_rate_entity.dart';
import 'package:expense_tracker_lite/domain/use_cases/get_today_exchange_rate_use_case.dart';
import 'package:expense_tracker_lite/domain/use_cases/parameters/exchange_rates_params.dart';
import 'package:expense_tracker_lite/presentation/common/base_state.dart';
import 'package:expense_tracker_lite/presentation/common/status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'exchange_rates_event.dart';
part 'exchange_rates_state.dart';

final class ExchangeRatesBloc
    extends Bloc<ExchangeRatesEvent, ExchangeRatesState> {
  ExchangeRatesBloc({required this.getTodayExchangeRateUseCase})
    : super(const ExchangeRatesState()) {
    on<ExchangeRatesForTodayFetched>(_onExchangeRatesForTodayFetched);
  }

  final GetTodayExchangeRateUseCase getTodayExchangeRateUseCase;

  Future<void> _onExchangeRatesForTodayFetched(
    ExchangeRatesForTodayFetched event,
    Emitter<ExchangeRatesState> emit,
  ) async {
    emit(const ExchangeRatesState(status: Status.loading));
    final result = await getTodayExchangeRateUseCase(
      ExchangeRatesParams(baseCurrency: event.baseCurrency),
    );
    result.fold(
      (l) => emit(ExchangeRatesState(status: Status.failure, failure: l)),
      (r) => emit(
        ExchangeRatesState(
          status: Status.success,
          todayExchangeRate: r,
          baseCurrency: event.baseCurrency,
        ),
      ),
    );
  }
}
