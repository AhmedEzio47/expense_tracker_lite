import 'dart:io';

import 'package:expense_tracker_lite/presentation/widgets/app_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:random_string/random_string.dart';

mixin ReceiptHandler {
  Future<File?> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    try {
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      // // Capture a photo.
      // final XFile? photo = await picker.pickImage(source: ImageSource.camera);

      if (image == null) {
        throw Exception('Error while picking the image');
      }
      return File(image.path);
    } catch (ex) {
      AppSnackBar.show(
        context: context,
        message: ex.toString(),
        snackBarType: SnackBarTypes.error,
      );
      return null;
    }
  }

  Future<String?> saveReceiptFile(
    File pickedImageFile,
    BuildContext context,
  ) async {
    try {
      final docDir = await getApplicationDocumentsDirectory();

      final receiptsDir = Directory(p.join(docDir.path, 'receipts'));

      if (!await receiptsDir.exists()) {
        await receiptsDir.create(recursive: true);
      }

      final ext = p.extension(pickedImageFile.path).toLowerCase();
      final fileName = '${randomAlphaNumeric(10)}$ext';
      final saved = await pickedImageFile.copy(
        p.join(receiptsDir.path, fileName),
      );
      return saved.path;
    } catch (ex) {
      AppSnackBar.show(
        context: context,
        message: ex.toString(),
        snackBarType: SnackBarTypes.error,
      );
      return null;
    }
  }

  void showReceiptImage(BuildContext context, String path) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            spacing: 8,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.file(
                File(path),
                errorBuilder: (_, _, _) =>
                    Center(child: Icon(Icons.image_not_supported)),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                child: Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
