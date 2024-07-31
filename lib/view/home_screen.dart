import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:templete_editor/Constants/theme.dart';
import 'package:templete_editor/controller/edtior_controller.dart';
import 'package:templete_editor/widget/header_row.dart';
import 'package:templete_editor/widget/text_editor.dart';

class HomeScreen extends StatelessWidget {
  final TextController controller = Get.put(TextController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 19, 33),
        title: Text('Text Customizer',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: Get.width * 0.050,
            )),
      ),
      backgroundColor: Colors.grey[200], // Background color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderRow(controller: controller),
              const SizedBox(height: 20),
              TextEditor(controller: controller),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
