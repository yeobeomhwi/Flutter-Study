import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'HomeScreen.dart';
import 'SecondScreen.dart';
import 'ThirdScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/second',
        builder: (context, state) => SecondScreen(),
      ),
      GoRoute(
        path: '/third',
        builder: (context, state) => ThirdScreen(),
      ),
    ],
  );

  // final GoRouter _router = GoRouter(
  //   routes: <RouteBase>[
  //     GoRoute(
  //       path: '/',
  //       builder: (context, state) => HomeScreen(),
  //       routes: <RouteBase>[
  //         GoRoute(
  //           path: 'second',
  //           builder: (context, state) => SecondScreen(),
  //         ),
  //         GoRoute(
  //           path: 'third',
  //           builder: (context, state) => ThirdScreen(),
  //         ),
  //       ],
  //     ),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
