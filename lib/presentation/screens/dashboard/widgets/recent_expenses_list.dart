import 'package:flutter/material.dart';

class RecentExpensesList extends StatelessWidget {
  final expenses = const [
    {"title": "Groceries", "amount": "- \$100", "icon": Icons.shopping_cart},
    {"title": "Entertainment", "amount": "- \$100", "icon": Icons.movie},
    {
      "title": "Transportation",
      "amount": "- \$100",
      "icon": Icons.directions_car,
    },
    {"title": "Rent", "amount": "- \$100", "icon": Icons.home},
  ];

  const RecentExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Recent Expenses",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Text("See all", style: TextStyle(color: Colors.black)),
          ],
        ),
        const SizedBox(height: 8),
        ...expenses.map(
          (e) => _ExpenseItem(
            title: e["title"] as String,
            amount: e["amount"] as String,
            icon: e["icon"] as IconData,
          ),
        ),
      ],
    );
  }
}

class _ExpenseItem extends StatelessWidget {
  final String title;
  final String amount;
  final IconData icon;

  const _ExpenseItem({
    required this.title,
    required this.amount,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Manually",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Text(
                "Today 12:00 PM",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
