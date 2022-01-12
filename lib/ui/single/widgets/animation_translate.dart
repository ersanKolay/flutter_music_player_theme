import 'package:flutter/material.dart';

class AnimationTranslate extends StatelessWidget {
  const AnimationTranslate({Key? key, required this.child, this.back = true})
      : super(key: key);

  final Widget child;
  final bool back;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1, end: 0),
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutBack,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 300 * value),
          child: child,
        );
      },
      child: child,
    );
  }
}
