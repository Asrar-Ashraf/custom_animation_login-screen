import 'package:flutter/material.dart';
import 'package:flutter_staggered_animation/diffrent_shape.dart';

class Star extends StatelessWidget {
  const Star({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final Size(:width, :height) = size;
    return SizedBox(
      height: size.shortestSide * 0.1,
      width: size.shortestSide * 0.07,
      child: ClipPath(
        clipper: DiffrentShape(),
        child: Container(color: Colors.white),
      ),
    );
  }
}
