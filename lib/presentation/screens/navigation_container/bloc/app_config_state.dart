part of 'app_config_bloc.dart';

class AppConfigState {
  const AppConfigState({this.selectedTab = NavigationTab.home});

  final NavigationTab selectedTab;
}
