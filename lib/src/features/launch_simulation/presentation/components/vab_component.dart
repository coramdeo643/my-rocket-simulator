import 'dart:ui';
import 'package:flame/components.dart';

class VABComponent extends PositionComponent {
  VABComponent({required Vector2 position, required Vector2 size})
      : super(position: position, size: size, priority: 0);

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = const Color(0xFF8B8C8D); // 조립동 건물 색상 (어두운 회색)
    final doorPaint = Paint()..color = const Color(0xFF4A4A4A); // 도어 색상

    // 메인 건물
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
    
    // 조립동 거대 도어 (우측 하단)
    canvas.drawRect(Rect.fromLTWH(size.x * 0.4, size.y * 0.3, size.x * 0.6, size.y * 0.7), doorPaint);
    
    // 지붕 장식선
    final linePaint = Paint()..color = const Color(0xFF333333)..strokeWidth = 4;
    canvas.drawLine(Offset(0, 0), Offset(size.x, 0), linePaint);
  }
}
