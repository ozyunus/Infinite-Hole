import 'dart:ui';

import 'package:flame/components.dart';

class Hole extends CircleComponent {
  Hole({required Vector2 position, double radius = 45})
    : super(radius: radius, position: position, anchor: Anchor.center) {
    paint
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
  }
}
