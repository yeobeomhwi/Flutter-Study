import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Animation Example')),
        body: Center(child: ScaleAnimationWidget()),
      ),
    );
  }
}

class ScaleAnimationWidget extends StatefulWidget {
  @override
  _ScaleAnimationWidgetState createState() => _ScaleAnimationWidgetState();
}

class _ScaleAnimationWidgetState extends State<ScaleAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticInOut,
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: Container(
            width: 120.0,
            height: 100.0,
            color: Colors.blue,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_controller.isAnimating) {
                    _controller.stop();
                  } else {
                    _controller.forward();
                  }
                },
                child: Text('Animate'),
              ),
            ),
          ),
        );
      },
    );
  }
}
