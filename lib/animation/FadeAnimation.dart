import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

// Create enum that defines the animated properties
enum AniProps { width, height, color, opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    /* final TimelineTween<AniProps> tween = TimelineTween<AniProps>()
    ..addScene()
     ([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
        Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
        curve: Curves.easeOut)
    ]); */

    final TimelineTween<AniProps> tween = TimelineTween<AniProps>()
      ..addScene(
              begin: const Duration(milliseconds: 0),
              end: const Duration(milliseconds: 500))
          .animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
      ..addScene(
              begin: const Duration(milliseconds: 0),
              end: const Duration(milliseconds: 500))
          .animate(AniProps.translateY, tween: Tween(begin:-30.0, end: 0.0));

    return PlayAnimation<TimelineValue<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(0, animation.get(AniProps.translateY)), 
          child: child
        ),
      ),
    );
  }
}