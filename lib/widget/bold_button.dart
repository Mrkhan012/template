import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete_editor/controller/edtior_controller.dart';

class BoldButton extends StatelessWidget {
  final TextController controller;

  const BoldButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.format_bold),
      onPressed: () {
        controller.toggleBold();
      },
      color: controller.isBold.value ? Colors.blue : Colors.black,
    );
  }
}
