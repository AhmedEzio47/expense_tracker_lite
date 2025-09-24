import 'package:expense_tracker_lite/core/enums/category.dart';
import 'package:expense_tracker_lite/presentation/screens/add_expense/widgets/categories_grid.dart';
import 'package:expense_tracker_lite/presentation/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  Category? selectedCategory = Category.entertainment;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController receiptController = TextEditingController();

  @override
  void dispose() {
    amountController.dispose();
    dateController.dispose();
    receiptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                setState(() => selectedCategory = value);
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

            // Save Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
          ],
        ),
      ),
    );
  }
}
