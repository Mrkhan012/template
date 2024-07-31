import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:templete_editor/Constants/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to home screen after 3 seconds
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offNamed('/home');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Templete Editor',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: Get.width * 0.044,
                )),
            const SizedBox(height: 20),
            Text('Version 10.0.0',
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontSize: Get.width * 0.035,
                )),
          ],
        ),
      ),
    );
  }
}
