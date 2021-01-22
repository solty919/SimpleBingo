import 'package:flutter/material.dart';

class FadeIn extends StatefulWidget {
  const FadeIn({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  _FadeInState createState() => _FadeInState();
}

class _FadeInState extends State<FadeIn> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animationController.forward(from: 0.0);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return widget.child;
        });
  }
}
