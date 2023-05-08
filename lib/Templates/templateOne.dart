import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:path_finder/Utils/colors.dart';
import 'package:path_finder/Utils/constants.dart';
import 'package:path_finder/Widgets/buttons.dart';
import 'dart:js' as js;
import 'dart:math';

import 'package:path_finder/Widgets/common.dart';
import 'package:path_finder/modules/Home/homeController.dart';

class TemplateOne extends GetView<HomeController> {
  const TemplateOne({Key? key}) : super(key: key);
@override
  HomeController get c => super.controller;
  @override
  Widget build(BuildContext context) {
    var myModel = c.selectedCareerModel;
    if (myModel.value == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Obx(() {
      var isCompleted = c.totalProcess.value ==
          c.selectedCareerModel.value?.model.proccess.length;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            c.process.length,
            (index) {
              final isLeft = (index + 1) % 2 != 0;
              final color = NewCustomColorPlatte().getRowColor(index: index);
              final process = c.process[index];
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: AnimationArcPainter(
                  isRight: index % 2 != 0,
                  child: BranchContainers(
                    color: color,
                    isLeftBranch: isLeft,
                    model: process,
                    index: index,
                  ).animate().moveY().scale(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomFloatingButton(
            btnColor: isCompleted ? Colors.green : Colors.red,
            icon: isCompleted
                ? Icons.thumb_up_alt_outlined
                : Icons.arrow_downward_sharp,
            btnLabel: isCompleted ? "All The Best" : "Next",
            onPressed: () => c.onClickNext(),
          )
              .animate(
                onPlay: (controller) => controller.repeat(reverse: true),
              )
              .move(),
          const SizedBox(
            height: 120,
          ),
        ],
      );
    });
  }
}

class AnimationArcPainter extends StatefulWidget {
  const AnimationArcPainter({
    Key? key,
    required this.child,
    this.isRight = false,
    this.painterColor,
  }) : super(key: key);
  final Widget child;
  final bool isRight;
  final Color? painterColor;

  @override
  State<AnimationArcPainter> createState() => _AnimationArcPainterState();
}

class _AnimationArcPainterState extends State<AnimationArcPainter>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: Painter(
            progress: _animation.value,
            isRight: widget.isRight,
            painterColor: widget.painterColor,
          ),
          child: widget.child,
        );
      },
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
      ..strokeWidth = 5.0;

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
