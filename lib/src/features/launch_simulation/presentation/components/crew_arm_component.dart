import 'dart:ui';
import 'package:flame/components.dart';

class CrewArmComponent extends PositionComponent {
  bool isConnected = false;
  double targetWidth = 0.0;
  
  CrewArmComponent({required Vector2 position, required Vector2 size})
      : super(position: position, size: size, priority: 3);

  @override
  void update(double dt) {
    super.update(dt);
    if (isConnected && width < targetWidth) {
      width += 50 * dt; // 천천히 연장
      if (width > targetWidth) width = targetWidth;
    } else if (!isConnected && width > 0) {
      width -= 150 * dt; // 빠르게 분리
      if (width < 0) width = 0;
    }
  }

  @override
  void render(Canvas canvas) {
    if (width <= 0) return;
    
    final paint = Paint()..color = const Color(0xFFD32F2F); // 빨간색 암
    canvas.drawRect(Rect.fromLTWH(0, 0, width, size.y), paint);
    
    // 점선 디테일
    final linePaint = Paint()..color = const Color(0xFFFFFFFF)..strokeWidth = 2;
    for (double i = 0; i < width; i += 10) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.y), linePaint);
    }
  }
}
