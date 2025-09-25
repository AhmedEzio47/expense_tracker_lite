import 'package:expense_tracker_lite/core/enums/category.dart';
import 'package:expense_tracker_lite/presentation/common/status.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/bloc/add_expense_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/widgets/categories_grid.dart';
import 'package:expense_tracker_lite/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddExpenseContent extends HookWidget {
  const AddExpenseContent({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategory = useState<Category?>(null);
    final amountController = useTextEditingController();
    final dateController = useTextEditingController();
    final receiptController = useTextEditingController();
    final selectedDate = useState<DateTime>(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          "Add Expense",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Dropdown
            const Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<Category>(
              initialValue: selectedCategory.value,
              items: Category.values.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat.name));
              }).toList(),
              onChanged: (value) {
                selectedCategory.value = value;
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 12,
                ),
              ),
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: amountController,
              label: 'Amount',
              hintText: "\$50,000",
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: dateController,
              label: 'Date',
              hintText: "24/09/25",
              readOnly: true,
              suffixIcon: Icons.calendar_month_outlined,
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                  currentDate: selectedDate.value,
                );
                if (picked != null) {
                  dateController.text =
                      "${picked.day}/${picked.month}/${picked.year}";
                }
              },
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: receiptController,
              label: 'Attach Receipt',
              hintText: "Upload image",
              readOnly: true,
              suffixIcon: Icons.camera_alt_outlined,
              onTap: () {
                // TODO: Pick image
              },
            ),

            const SizedBox(height: 24),

            // Categories Grid
            const Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),

            const SizedBox(height: 16),

            CategoriesGrid(),

            const SizedBox(height: 24),

            /// Save Button
            BlocConsumer<AddExpenseBloc, AddExpenseState>(
              listener: (context, state) {
                if (state.status == Status.success) {
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                if (state.status == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (selectedCategory.value == null ||
                          amountController.text.isEmpty ||
                          dateController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all required fields"),
                          ),
                        );
                        return;
                      }

                      context.read<AddExpenseBloc>().add(
                        ExpenseSubmitted(
                          categoryId: selectedCategory.value!.id,
                          amount: double.tryParse(amountController.text) ?? 0.0,
                          date: selectedDate.value,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Save",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
