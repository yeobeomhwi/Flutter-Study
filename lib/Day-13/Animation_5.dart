import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Tween Example')),
        body: Center(child: TweenAnimationWidget()),
      ),
    );
  }
}

class TweenAnimationWidget extends StatefulWidget {
  @override
  State<TweenAnimationWidget> createState() => _TweenAnimationWidgetState();
}

class _TweenAnimationWidgetState extends State<TweenAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _colorAnimation =
        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return Container(
          width: 150.0,
          height: 150.0,
          color: _colorAnimation.value,
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                if (_controller.isAnimating) {
                  _controller.stop();
                } else {
                  _controller.forward();
                }
              },
              child: Text('Animate Color'),
            ),
          ),
        );
      },
    );
  }
}
