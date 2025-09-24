import 'package:expense_tracker_lite/core/enums/balance_type.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF496EF3),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Total Balance",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(Icons.keyboard_arrow_up, color: Colors.white, size: 20),
              Spacer(),
              Icon(Icons.more_horiz, color: Colors.white),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "\$ 2,548.00",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _BalanceInfo(amount: "\$ 10,840.00", type: BalanceType.income),
              _BalanceInfo(amount: "\$ 1,884.00", type: BalanceType.expenses),
            ],
          ),
        ],
      ),
    );
  }
}

class _BalanceInfo extends StatelessWidget {
  final String amount;
  final BalanceType type;

  const _BalanceInfo({required this.amount, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 2,
      children: [
        Row(
          spacing: 5,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(type.icon, color: Colors.white, size: 15),
            ),
            Text(
              type.label,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Text(
          amount,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
