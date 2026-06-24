import 'dart:math';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/particles.dart';

class EffectsFactory {
  static final Random _rnd = Random();

  // 하얀 증기 파티클 (Fueling)
  static ParticleSystemComponent createVaporEffect({required Vector2 position}) {
    return ParticleSystemComponent(
      position: position,
      particle: Particle.generate(
        count: 20,
        lifespan: 1.5,
        generator: (i) {
          final velocity = Vector2(_rnd.nextDouble() * 20 - 10, _rnd.nextDouble() * 20 + 10);
          return AcceleratedParticle(
            acceleration: Vector2(0, 10),
            speed: velocity,
            position: Vector2.zero(),
            child: ComputedParticle(
              renderer: (canvas, particle) {
                final paint = Paint()
                  ..color = const Color(0xFFFFFFFF).withValues(alpha: 1.0 - particle.progress);
                canvas.drawCircle(Offset.zero, 3 + _rnd.nextDouble() * 4, paint);
              },
            ),
          );
        },
      ),
    );
  }

  // 폭발 파티클 (실패 시)
  static ParticleSystemComponent createExplosion({required Vector2 position}) {
    return ParticleSystemComponent(
      position: position,
      particle: Particle.generate(
        count: 50,
        lifespan: 1.0,
        generator: (i) {
          final angle = _rnd.nextDouble() * 2 * pi;
          final speed = _rnd.nextDouble() * 150 + 50;
          final velocity = Vector2(cos(angle) * speed, sin(angle) * speed);
          
          return AcceleratedParticle(
            speed: velocity,
            position: Vector2.zero(),
            child: ComputedParticle(
              renderer: (canvas, particle) {
                final color = _rnd.nextBool() ? const Color(0xFFFF4500) : const Color(0xFFFFD700);
                final paint = Paint()..color = color.withValues(alpha: 1.0 - particle.progress);
                canvas.drawCircle(Offset.zero, 5 + _rnd.nextDouble() * 10, paint);
              },
            ),
          );
        },
      ),
    );
  }

  // 스파크 파티클 (마찰 / 전기 스파크)
  static ParticleSystemComponent createSparks({required Vector2 position, Color color = const Color(0xFFFFA500)}) {
    return ParticleSystemComponent(
      position: position,
      particle: Particle.generate(
        count: 15,
        lifespan: 0.5,
        generator: (i) {
          final angle = _rnd.nextDouble() * pi; // 위쪽으로 주로 튐
          final speed = _rnd.nextDouble() * 100 + 50;
          final velocity = Vector2(cos(angle) * speed, -sin(angle) * speed);
          
          return AcceleratedParticle(
            acceleration: Vector2(0, 200), // 중력 영향
            speed: velocity,
            position: Vector2.zero(),
            child: ComputedParticle(
              renderer: (canvas, particle) {
                final paint = Paint()..color = color.withValues(alpha: 1.0 - particle.progress);
                canvas.drawRect(Rect.fromLTWH(0, 0, 3, 3), paint);
              },
            ),
          );
        },
      ),
    );
  }
}
