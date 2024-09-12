import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
