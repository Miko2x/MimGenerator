import 'package:flutter/material.dart';
import 'package:matrix_gesture_detector_pro/matrix_gesture_detector_pro.dart';

class MimDragScaleWidget extends StatelessWidget {
  final ValueNotifier<Matrix4> notifier;
  final Widget child;
  final double height;
  const MimDragScaleWidget({
    super.key,
    required this.child,
    required this.height,
    required this.notifier,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: MatrixGestureDetector(
        onMatrixUpdate: (m, tm, sm, rm) {
          notifier.value = m;
        },
        child: AnimatedBuilder(
          animation: notifier,
          builder: (ctx, childWidget) {
            return Transform(
              transform: notifier.value,
              child: Align(
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}