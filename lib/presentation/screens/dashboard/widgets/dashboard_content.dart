import 'package:flutter/material.dart';

import 'header_section.dart';
import 'recent_expenses_list.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HeaderSection(),
          Expanded(child: RecentExpensesList()),
        ],
      ),
    );
  }
}
