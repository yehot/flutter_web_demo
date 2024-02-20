import 'package:flutter/material.dart';

class CupertinoTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  CupertinoTransition({
    required this.child,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      child: child,
      position: Tween<Offset>(
        begin: Offset(1.0, 0.0),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut)));
  }
}
