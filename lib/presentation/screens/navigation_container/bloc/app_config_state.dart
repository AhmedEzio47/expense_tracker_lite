part of 'app_config_bloc.dart';

class AppConfigState {
  const AppConfigState({
    this.selectedTab = NavigationTab.home,
    this.selectedCurrency = kBaseCurrency,
  });

  final NavigationTab selectedTab;
  final String selectedCurrency;

  AppConfigState copyWith({
    NavigationTab? selectedTab,
    String? selectedCurrency,
  }) => AppConfigState(
    selectedCurrency: selectedCurrency ?? this.selectedCurrency,
    selectedTab: selectedTab ?? this.selectedTab,
  );
}
