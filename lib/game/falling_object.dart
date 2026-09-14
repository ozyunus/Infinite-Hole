import 'dart:math';
import 'dart:ui';

import 'package:flame/components.dart';

enum FallingShape { circle, square, hexagon, octagon }

class FallingObject extends PositionComponent {
  FallingObject({
    required Vector2 position,
    required this.radius,
    required this.speed,
    required this.shape,
  }) : super(
         position: position,
         anchor: Anchor.center,
         size: Vector2.all(radius * 2),
       );

  final double radius;
  final double speed;
  final FallingShape shape;

  final Paint _paint = Paint()
    ..style = PaintingStyle.fill
    ..color = const Color(0xFFFFFFFF);

  @override
  void update(double dt) {
    super.update(dt);

    position.y += speed * dt;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final center = Offset(radius, radius);

    switch (shape) {
      case FallingShape.circle:
        canvas.drawCircle(center, radius, _paint);
        break;

      case FallingShape.square:
        canvas.drawRect(
          Rect.fromCenter(
            center: center,
            width: radius * 2,
            height: radius * 2,
          ),
          _paint,
        );
        break;

      case FallingShape.hexagon:
        _drawPolygon(canvas, center, radius, 6);
        break;

      case FallingShape.octagon:
        _drawPolygon(canvas, center, radius, 8);
        break;
    }
  }

  void _drawPolygon(Canvas canvas, Offset center, double radius, int sides) {
    final path = Path();

    for (var i = 0; i < sides; i++) {
      final angle = -3.1415926535 / 2 + (2 * 3.1415926535 * i / sides);

      final point = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      if (i == 0) {
        path.moveTo(point.dx, point.dy);
      } else {
        path.lineTo(point.dx, point.dy);
      }
    }

    path.close();

    canvas.drawPath(path, _paint);
  }
}
