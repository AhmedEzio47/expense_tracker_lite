import 'package:expense_tracker_lite/core/constants.dart';
import 'package:expense_tracker_lite/core/enums/navigation_tab.dart';
import 'package:expense_tracker_lite/core/enums/storage_key.dart';
import 'package:expense_tracker_lite/data/storage/storage_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_config_event.dart';
part 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  final StorageRepo storage;

  AppConfigBloc(this.storage) : super(const AppConfigState()) {
    on<NavigationTabSelected>((event, emit) {
      emit(state.copyWith(selectedTab: event.tab));
    });

    on<CurrencySelected>((event, emit) {
      emit(state.copyWith(selectedCurrency: event.currencyCode));
      storage.write(key: StorageKey.currency.key, value: event.currencyCode);
    });

    on<SelectedCurrencyFetched>((event, emit) async {
      final currency = await storage.read(StorageKey.currency.key);
      emit(state.copyWith(selectedCurrency: currency));
    });
  }
}
