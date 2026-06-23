import 'dart:ui';
import 'package:flame/components.dart';

class FirstStageComponent extends PositionComponent {
  bool engineOn = false;
  bool isDescending = false; // 역추진 여부

  FirstStageComponent({required Vector2 size}) : super(size: size);

  @override
  void render(Canvas canvas) {
    // 1단 몸체 (은색 느낌)
    final paint = Paint()..color = const Color(0xFFDDDDDD);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.x, size.y), paint);
    
    // 엔진 파티클/불꽃 렌더링
    if (engineOn) {
      final flamePaint = Paint()..color = const Color(0xFFFF4500);
      if (isDescending) {
        // 하강 역추진 (부채꼴 모양 불꽃)
        canvas.drawCircle(Offset(size.x / 2, size.y + 15), 15, flamePaint);
      } else {
        // 상승 추진 (길쭉한 불꽃)
        canvas.drawRect(Rect.fromLTWH(size.x * 0.2, size.y, size.x * 0.6, 50), flamePaint);
      }
    }
  }
}
