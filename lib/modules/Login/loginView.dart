import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:path_finder/Utils/colors.dart';
import 'package:path_finder/Widgets/buttons.dart';
import 'dart:math';

import '../../Widgets/textfield.dart';
import '../../routes/app_pages.dart';
import 'loginController.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  LoginController get c => super.controller;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.modelsHome);
                    },
                    child: Container(
                      // color: Colors.red,
                      width: 30,
                      height: 30,
                    ))
              ],
            ),
            Center(
              child: SizedBox(
                height: size.height * 0.8,
                width: size.width * 0.6,
                child: Obx(
                  () {
                    return ModalProgressHUD(
                      inAsyncCall: c.isLoading.value,
                      progressIndicator: CircularProgressIndicator(
                        color: NewCustomColorPlatte().pink,
                      ),
                      child: Center(
                        child: Card(
                          color: Colors.white,
                          elevation: 5,
                          shadowColor: NewCustomColorPlatte().blueColor,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: NewCustomColorPlatte().blueColor,
                                  width: 3),
                              borderRadius: BorderRadius.circular(15)),
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              children: [
                                Text(
                                  "First Login Yourself",
                                  style: TextStyle(
                                    color: NewCustomColorPlatte().headingColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textScaleFactor: 2,
                                ),
                                Text(
                                  "Please enter you login id and password in form given below...",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: NewCustomColorPlatte().textColor,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextFiled(
                                  label: "Enter Login Id",
                                  onChanged: (value) {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextFiled(
                                  label: "Enter Password Id",
                                  onChanged: (value) {},
                                ),
                                const Spacer(),
                                const Divider(
                                  color: Colors.pink,
                                  thickness: 3,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    CustomElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.form);
                                        // Navigator.of(context).push(
                                        //   MaterialPageRoute(
                                        //     builder: (context) => const FormScreen(),
                                        //   ),
                                        // );
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Painter extends CustomPainter {
  final double progress;
  final bool isRight;
  final Color? painterColor;

  Painter({required this.progress, this.isRight = true, this.painterColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = painterColor ?? Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 30.0;

    final path = Path();
    if (isRight) {
      final sweepAngle = pi * progress;
      const startAngle = pi / 2;
      path.addArc(
        Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
        -startAngle,
        sweepAngle,
      );
    } else {
      final sweepAngle = pi * progress;
      final startAngle = pi / 2 + (1 - progress) * pi;
      path.addArc(
        Rect.fromPoints(Offset.zero, Offset(size.width, size.height)),
        startAngle,
        sweepAngle,
      );
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
