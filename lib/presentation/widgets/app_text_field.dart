import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.label,
    this.hintText,
    this.onTap,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String? label;
  final String? hintText;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextInputType keyboardType;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          onTap: onTap,
          keyboardType: keyboardType,
          readOnly: readOnly,
          decoration: InputDecoration(
            isDense: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
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
            suffixIcon: suffixIcon != null ? Icon(suffixIcon, size: 25) : null,
          ),
        ),
      ],
    );
  }
}
