import 'package:expense_tracker_lite/presentation/screens/dashboard/dashboard_screen.dart';
import 'package:expense_tracker_lite/presentation/screens/navigation_container/bloc/app_config_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationTab {
  home(Icons.home_rounded),
  analytics(Icons.bar_chart_outlined),
  wallet(Icons.wallet_outlined),
  profile(Icons.person_outline);

  final IconData icon;

  const NavigationTab(this.icon);

  Widget tab(bool isSelected, BuildContext context) => _TabButton(
    isSelected: isSelected,
    icon: icon,
    onPressed: () =>
        context.read<AppConfigBloc>().add(NavigationTabSelected(this)),
  );

  Widget screen() {
    switch (this) {
      case home:
        return DashboardScreen();
      case analytics:
        return Scaffold(body: Center(child: Text('Analytics')));
      case wallet:
        return Scaffold(body: Center(child: Text('Wallet')));
      case profile:
        return Scaffold(body: Center(child: Text('Profile')));
    }
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.isSelected,
    required this.icon,
    this.onPressed,
  });

  final bool isSelected;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        size: 40,
        color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
      ),
      onPressed: onPressed,
    );
  }
}
