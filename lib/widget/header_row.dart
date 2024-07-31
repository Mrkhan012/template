import 'package:flutter/material.dart';
import 'package:templete_editor/controller/edtior_controller.dart';
import 'package:templete_editor/widget/bold_button.dart';
import 'package:templete_editor/widget/color_picker.dart';
import 'package:templete_editor/widget/font_family.dart';
import 'package:templete_editor/widget/font_size.dart';

class HeaderRow extends StatelessWidget {
  final TextController controller;

  const HeaderRow({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row for undo, redo, font family, font size, and color picker
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.undo),
              onPressed: () {
                controller.undo();
              },
            ),
            IconButton(
              icon: const Icon(Icons.redo),
              onPressed: () {
                controller.redo();
              },
            ),
            FontFamilyDropdown(controller: controller),
            FontSizeDropdown(controller: controller),
            ColorPickerButton(controller: controller),
          ],
        ),
        // BoldButton displayed outside the row
        const SizedBox(height: 10), // Space between row and BoldButton
        BoldButton(controller: controller),
      ],
    );
  }
}
