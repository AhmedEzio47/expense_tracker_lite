import 'package:expense_tracker_lite/presentation/screens/dashboard/bloc/expenses_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BouncingArrow extends StatefulWidget {
  const BouncingArrow({super.key});

  @override
  State<BouncingArrow> createState() => _BouncingArrowState();
}

class _BouncingArrowState extends State<BouncingArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true); // makes it go up and down endlessly

    _animation = Tween<double>(
      begin: 1,
      end: 4,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<ExpensesBloc>().add(ExpensesListToggled()),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(1, _animation.value),
            child: Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF496EF3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
