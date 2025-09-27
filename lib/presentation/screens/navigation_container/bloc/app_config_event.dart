part of 'app_config_bloc.dart';

sealed class AppConfigEvent {
  const AppConfigEvent();
}

class NavigationTabSelected extends AppConfigEvent {
  const NavigationTabSelected(this.tab);

  final NavigationTab tab;
}
