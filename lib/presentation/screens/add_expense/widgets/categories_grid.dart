import 'package:expense_tracker_lite/core/enums/category.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/bloc/add_expense_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CategoriesGrid extends HookWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = context
        .select((AddExpenseBloc bloc) => bloc.state)
        .selectedCategory;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 90,
      ),
      itemCount: Category.values.length,
      itemBuilder: (context, index) {
        final cat = Category.values[index];
        final isSelected = cat == selectedCategory;
        return GestureDetector(
          onTap: () {
            context.read<AddExpenseBloc>().add(CategorySelected(cat));
          },
          child: Column(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: isSelected
                    ? Theme.of(context).primaryColor
                    : Colors.grey.shade200,
                child: Icon(
                  cat.icon,
                  color: isSelected ? Colors.white : Colors.black54,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                cat.name,
                style: TextStyle(
                  fontSize: 12,
                  color: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
