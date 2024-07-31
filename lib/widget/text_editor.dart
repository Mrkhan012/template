import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete_editor/controller/edtior_controller.dart';

class TextEditor extends StatelessWidget {
  final TextController controller;

  const TextEditor({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          width: Get.width,
          height: Get.height * 0.7,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 2),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              Positioned(
                left: controller.textPosition.value.dx,
                top: controller.textPosition.value.dy,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    controller.setTextPosition(
                      Offset(
                        controller.textPosition.value.dx + details.delta.dx,
                        controller.textPosition.value.dy + details.delta.dy,
                      ),
                    );
                  },
                  child: SizedBox(
                    width: Get.width * 0.8,
                    child: TextField(
                      controller:
                          TextEditingController(text: controller.text.value)
                            ..selection = TextSelection.collapsed(
                                offset: controller.text.value.length),
                      onChanged: (text) => controller.setText(text),
                      style: TextStyle(
                        fontFamily: controller.fontFamily.value,
                        fontSize: controller.fontSize.value,
                        color: controller.textColor.value,
                        fontWeight: controller.isBold.value
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      maxLines: null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
