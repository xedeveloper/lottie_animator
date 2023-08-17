import 'package:flutter/widgets.dart';

class LottieController {
  final AnimationController animationController;

  LottieController({
    required this.animationController,
  });
  void animate({required double from, required double to}) {
    animationController.animate(from: from, to: to);
  }

  void dispose() {
    animationController.dispose();
  }
}

extension on AnimationController {
  void animate({required double from, required double to}) {
    forward(from: from);
    addListener(() {
      if (value >= to) {
        stop();
        reset();
      }
    });
  }
}
