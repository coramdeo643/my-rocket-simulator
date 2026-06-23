import 'dart:ui';
import 'package:flame/components.dart';

class LaunchPadComponent extends PositionComponent {
  LaunchPadComponent({required Vector2 position, required Vector2 size})
      : super(position: position, size: size, priority: 1);

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = const Color(0xFF555555); // 회색 계열 철골
    // 메인 타워
    canvas.drawRect(Rect.fromLTWH(size.x * 0.1, 0, size.x * 0.3, size.y), paint);
    // 베이스 플랫폼
    canvas.drawRect(Rect.fromLTWH(0, size.y * 0.8, size.x, size.y * 0.2), paint);
  }
}
