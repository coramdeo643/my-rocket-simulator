import 'package:flutter/material.dart';
import 'package:flame/components.dart';

class DroneShipComponent extends PositionComponent {
  DroneShipComponent({required Vector2 position, required Vector2 size})
      : super(position: position, size: size, priority: 1);

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = const Color(0xFF333333); 
    canvas.drawRect(Rect.fromLTWH(0, size.y * 0.5, size.x, size.y * 0.5), paint);
    
    final textPaint = TextPaint(
      style: const TextStyle(
        color: Color(0xFFFFFFFF),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
    textPaint.render(canvas, 'X', Vector2(size.x / 2 - 10, size.y * 0.5 - 30));
  }
}
