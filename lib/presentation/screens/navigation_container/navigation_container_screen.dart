import 'package:expense_tracker_lite/di/di.dart';
import 'package:expense_tracker_lite/presentation/screens/navigation_container/widgets/navigation_container_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/app_config_bloc.dart';

class NavigationContainerScreen extends StatelessWidget {
  const NavigationContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<AppConfigBloc>(),
      child: NavigationContainerContent(),
    );
  }
}
