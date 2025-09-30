import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animation/horizental.dart';
import 'package:flutter_staggered_animation/vertical.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Widget build(BuildContext context) {
    Random random = Random();
    final size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Vertical();
          } else {
            return Horizental();
          }
        },
      ),
    );
  }
}
