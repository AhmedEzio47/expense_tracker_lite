import 'package:expense_tracker_lite/presentation/screens/navigation_container/bloc/app_config_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_bottom_navigation_bar.dart';

class NavigationContainerContent extends StatelessWidget {
  const NavigationContainerContent({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select(
      (AppConfigBloc bloc) => bloc.state.selectedTab,
    );
    return Scaffold(
      body: selectedTab.screen(),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
