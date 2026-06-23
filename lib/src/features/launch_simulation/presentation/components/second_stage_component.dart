import 'dart:ui';
import 'package:flame/components.dart';

class SecondStageComponent extends PositionComponent {
  bool engineOn = false;

  SecondStageComponent({required Vector2 size}) : super(size: size);

  @override
  void render(Canvas canvas) {
    // 2단 몸체
    final paint = Paint()..color = const Color(0xFFFFFFFF);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
    
    // 페이로드 페어링 (원뿔 형태)
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.x / 2, -size.x * 1.5)
      ..lineTo(size.x, 0)
      ..close();
    canvas.drawPath(path, paint);

    // 엔진 불꽃 (진공 엔진)
    if (engineOn) {
      final flamePaint = Paint()..color = const Color(0xFFFF8C00); // 주황색 톤
      canvas.drawRect(Rect.fromLTWH(size.x * 0.3, size.y, size.x * 0.4, 30), flamePaint);
    }
  }
}
