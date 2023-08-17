import 'package:flutter/material.dart';
import 'package:lottie_animator/player/lottie_controller.dart';
import 'package:lottie/lottie.dart';

class LottieAnimator extends StatefulWidget {
  final String lottiePath;
  final void Function(LottieController controller) onLoaded;
  const LottieAnimator({
    super.key,
    required this.lottiePath,
    required this.onLoaded,
  });

  @override
  State<LottieAnimator> createState() => _LottieAnimatorState();
}

class _LottieAnimatorState extends State<LottieAnimator>
    with TickerProviderStateMixin {
  late LottieController lottieController;
  @override
  void initState() {
    lottieController =
        LottieController(animationController: AnimationController(vsync: this));
    super.initState();

    widget.onLoaded(lottieController);
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      widget.lottiePath,
      controller: lottieController.animationController,
      onLoaded: (composition) =>
          lottieController.animationController.duration = composition.duration,
    );
  }

  @override
  void dispose() {
    super.dispose();
    lottieController.dispose();
  }
}
