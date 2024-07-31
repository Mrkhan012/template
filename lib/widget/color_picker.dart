import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:templete_editor/controller/edtior_controller.dart';

class ColorPickerButton extends StatelessWidget {
  final TextController controller;

  const ColorPickerButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.defaultDialog(
          title: 'Pick a Color',
          content: ColorPicker(
            pickerColor: controller.textColor.value,
            onColorChanged: (color) {
              controller.setTextColor(color);
            },
            showLabel: false,
            pickerAreaHeightPercent: 0.8,
          ),
          confirm: TextButton(
            onPressed: () => Get.back(),
            child: const Text('OK'),
          ),
        );
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: controller.textColor.value,
          border: Border.all(color: Colors.black, width: 1),
        ),
      ),
    );
  }
}
