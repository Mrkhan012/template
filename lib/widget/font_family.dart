import 'package:flutter/material.dart';
import 'package:templete_editor/controller/edtior_controller.dart';

class FontFamilyDropdown extends StatelessWidget {
  final TextController controller;

  const FontFamilyDropdown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: controller.fontFamily.value,
      items: <String>[
        'Arial',
        'Verdana',
        'Times New Roman',
        'Courier New',
        'Georgia',
        'Tahoma',
        'Trebuchet MS',
        'Helvetica',
        'Impact',
        'Comic Sans MS',
        'Roboto',
        'Open Sans',
        'Lato',
        'Montserrat',
        'Poppins'
      ].map((String font) {
        return DropdownMenuItem<String>(
          value: font,
          child: Text(font),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) controller.setFontFamily(value);
      },
    );
  }
}
