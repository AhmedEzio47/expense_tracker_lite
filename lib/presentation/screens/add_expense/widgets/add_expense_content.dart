import 'package:expense_tracker_lite/core/enums/category.dart';
import 'package:expense_tracker_lite/core/extensions/context_extensions.dart';
import 'package:expense_tracker_lite/core/extensions/date_formatting.dart';
import 'package:expense_tracker_lite/presentation/common/status.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/bloc/add_expense_bloc.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/handlers/expense_input_validator.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/handlers/receipt_handler.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/widgets/categories_grid.dart';
import 'package:expense_tracker_lite/presentation/widgets/app_snack_bar.dart';
import 'package:expense_tracker_lite/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddExpenseContent extends HookWidget
    with ReceiptHandler, ExpenseInputValidator {
  const AddExpenseContent({super.key});

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController();
    final dateController = useTextEditingController();
    final receiptController = useTextEditingController();
    final selectedDate = useState<DateTime>(DateTime.now());
    final receiptPath = useState<String?>(null);

    final selectedCategory = context
        .select((AddExpenseBloc bloc) => bloc.state)
        .selectedCategory;

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
              initialValue: selectedCategory,
              items: Category.values.map((cat) {
                return DropdownMenuItem(value: cat, child: Text(cat.name));
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  context.read<AddExpenseBloc>().add(CategorySelected(value));
                }
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
              label: 'Amount in  (${context.getSelectedCurrencySymbol()})',
              hintText: "${context.getSelectedCurrencySymbol()} 50,000",
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 16),

            AppTextField(
              controller: dateController,
              label: 'Date',
              hintText: selectedDate.value.formattedYMD,
              readOnly: true,
              suffixIcon: Icons.calendar_month_outlined,
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
                if (picked != null) {
                  dateController.text = picked.formattedYMD;
                  selectedDate.value = picked;
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
              onTap: () async {
                final receiptImage = await pickImage(context);
                if (receiptImage != null) {
                  final path = await saveReceiptFile(receiptImage, context);
                  receiptPath.value = path;
                  receiptController.text = path ?? '';
                }
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
                return Hero(
                  tag: 'add_expense',
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        final error = validateExpense(
                          category: selectedCategory,
                          amountText: amountController.text,
                          date: selectedDate.value,
                        );

                        if (error != null) {
                          AppSnackBar.show(
                            context: context,
                            message: error,
                            snackBarType: SnackBarTypes.error,
                          );

                          return;
                        }

                        final amountInBaseCurrency = context
                            .amountInBaseCurrency(
                              double.tryParse(amountController.text) ?? 0.0,
                            );

                        context.read<AddExpenseBloc>().add(
                          ExpenseSubmitted(
                            category: selectedCategory!,
                            amount: amountInBaseCurrency,
                            date: selectedDate.value,
                            receiptImagePath: receiptPath.value,
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
