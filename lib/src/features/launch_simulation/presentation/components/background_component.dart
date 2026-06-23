import 'package:flutter/material.dart';
import 'package:flame/components.dart';

class BackgroundComponent extends PositionComponent {
  BackgroundComponent() : super(priority: 0);

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF000033), Color(0xFF87CEEB)],
      ).createShader(Rect.fromLTWH(0, 0, width, height));
    
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), paint);

    final groundPaint = Paint()..color = const Color(0xFF228B22);
    canvas.drawRect(Rect.fromLTWH(0, height - 100, width, 100), groundPaint);
  }
}
