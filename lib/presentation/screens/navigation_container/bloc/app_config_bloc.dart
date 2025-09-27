import 'package:expense_tracker_lite/core/enums/navigation_tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_config_event.dart';
part 'app_config_state.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  AppConfigBloc() : super(const AppConfigState()) {
    on<NavigationTabSelected>((event, emit) {
      emit(AppConfigState(selectedTab: event.tab));
    });
  }
}
