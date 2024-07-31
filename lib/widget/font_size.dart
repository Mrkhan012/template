import 'package:flutter/material.dart';
import 'package:templete_editor/controller/edtior_controller.dart';

class FontSizeDropdown extends StatelessWidget {
  final TextController controller;

  const FontSizeDropdown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<double>(
      value: controller.fontSize.value,
      items: [16.0, 18.0, 20.0, 22.0, 24.0, 30.0].map((double size) {
        return DropdownMenuItem<double>(
          value: size,
          child: Text('$size'),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) controller.setFontSize(value);
      },
    );
  }
}
