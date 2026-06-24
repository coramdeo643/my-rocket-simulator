import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';

import '../../domain/launch_stage.dart';
import 'first_stage_component.dart';
import 'second_stage_component.dart';
import 'crew_arm_component.dart';
import 'effects_factory.dart';

class RocketComponent extends PositionComponent {
  late FirstStageComponent firstStage;
  late SecondStageComponent secondStage;
  final CrewArmComponent crewArm;

  LaunchStage currentStage = LaunchStage.rollout;

  final Vector2 vabPosition;
  final Vector2 launchPadPosition;

  Vector2 velocity = Vector2.zero();
  double gravity = 300.0;
  double thrust = 0.0;
  
  bool isStaged = false;
  bool isFailed = false;

  ParticleSystemComponent? activeVapor;

  RocketComponent({
    required Vector2 position, 
    required Vector2 size,
    required this.launchPadPosition,
    required this.crewArm,
  }) : vabPosition = position.clone(), super(position: position, size: size, priority: 2) {
    
    firstStage = FirstStageComponent(size: Vector2(size.x, size.y * 0.7))
      ..position = Vector2(0, size.y * 0.3);
      
    secondStage = SecondStageComponent(size: Vector2(size.x, size.y * 0.3))
      ..position = Vector2(0, 0);

    add(firstStage);
    add(secondStage);
    
    // 초기에는 누워있음 (-90도)
    anchor = Anchor.bottomCenter;
    angle = -pi / 2;
  }

  void updateStage(LaunchStage stage) {
    if (isFailed) return;
    currentStage = stage;
    
    switch(stage) {
      case LaunchStage.rollout:
        thrust = 0;
        firstStage.engineOn = false;
        break;
      case LaunchStage.erecting:
        break;
      case LaunchStage.boarding:
        crewArm.isConnected = true;
        break;
      case LaunchStage.fueling:
        // 증기 발생 시작
        if (activeVapor == null) {
          activeVapor = EffectsFactory.createVaporEffect(position: Vector2(size.x / 2, size.y));
          add(activeVapor!);
        }
        break;
      case LaunchStage.ignition:
        crewArm.isConnected = false;
        if (activeVapor != null) {
          activeVapor!.removeFromParent();
          activeVapor = null;
        }
        firstStage.engineOn = true;
        firstStage.isDescending = false;
        break;
      case LaunchStage.liftoff:
        firstStage.engineOn = true;
        thrust = -500.0; // 강한 상승 추력
        break;
      case LaunchStage.staging:
        isStaged = true;
        firstStage.engineOn = false;
        secondStage.engineOn = true; // 진공 엔진 점화
        break;
      case LaunchStage.descent:
        thrust = 0; // 자유 낙하 시작
        break;
      case LaunchStage.landing:
        firstStage.engineOn = true;
        firstStage.isDescending = true;
        thrust = -450.0; // 감속을 위한 역추진
        break;
    }
  }

  void triggerFailure(String? failedId) {
    isFailed = true;
    
    switch (failedId) {
      // Rollout Failures
      case 'ro_1': // 빠르게 이동 -> 전복
        add(RotateEffect.by(pi / 2, EffectController(duration: 0.5)));
        break;
      case 'ro_2': // 돌풍 대처 -> 꺾임
        add(RotateEffect.by(pi / 4, EffectController(duration: 0.3)));
        break;
      case 'ro_3': // 크롤러 궤도 점검 -> 덜컹거리고 불꽃
        add(MoveEffect.by(Vector2(0, 20), EffectController(duration: 0.1, alternate: true, repeatCount: 3)));
        parent?.add(EffectsFactory.createSparks(position: position.clone()..y += 50));
        break;
      case 'ro_4': // 엄빌리컬 케이블 -> 붉은 경고등 (투명도 깜빡임으로 대체)
        add(ScaleEffect.to(Vector2(0.9, 0.9), EffectController(duration: 0.2, alternate: true, repeatCount: 10)));
        break;

      // Erecting Failures
      case 'er_1': // 유압 장치 체크 -> 추락
        add(RotateEffect.to(-pi / 2, EffectController(duration: 0.2)));
        break;
      case 'er_2': // 풍속 확인 -> 꺾임
        secondStage.add(RotateEffect.by(pi / 2, EffectController(duration: 0.3)));
        break;
      case 'er_3': // 센서 영점 보정 -> 뒤로 넘어감
        add(RotateEffect.to(pi / 4, EffectController(duration: 0.5)));
        break;
      case 'er_4': // 클램프 체결 -> 미끄러짐
        add(MoveEffect.by(Vector2(0, 100), EffectController(duration: 0.5)));
        break;

      // Boarding Failures
      case 'bo_1': // 기압 테스트 -> 붉은 깜빡임
        add(ScaleEffect.to(Vector2(0.95, 0.95), EffectController(duration: 0.1, alternate: true, repeatCount: 10)));
        break;
      case 'bo_2': // 해치 점검 -> 가스
        add(EffectsFactory.createVaporEffect(position: Vector2(size.x / 2, 0)));
        break;
      case 'bo_3': // LES 무장 -> 위로 날아감
        secondStage.add(MoveEffect.by(Vector2(0, -500), EffectController(duration: 0.5)));
        parent?.add(EffectsFactory.createExplosion(position: position.clone()..y -= size.y));
        break;
      case 'bo_4': // 접지 -> 파란 스파크
        parent?.add(EffectsFactory.createSparks(position: position.clone()..y -= size.y / 2, color: Colors.blueAccent));
        break;

      // Fueling Failures
      case 'fu_1': // 예냉 -> 거대 가스 구름 폭발
        parent?.add(EffectsFactory.createExplosion(position: position.clone()));
        break;
      case 'fu_2': // 주입 순서 -> 부풀고 폭발
        add(ScaleEffect.to(Vector2(1.5, 1.0), EffectController(duration: 0.5)));
        Future.delayed(const Duration(milliseconds: 500), () {
          parent?.add(EffectsFactory.createExplosion(position: position.clone()..y -= size.y / 2));
        });
        break;
      case 'fu_3': // 배기 밸브 -> 터지는 폭발
        add(ScaleEffect.to(Vector2(1.2, 1.2), EffectController(duration: 0.5)));
        Future.delayed(const Duration(milliseconds: 500), () {
          parent?.add(EffectsFactory.createExplosion(position: position.clone()..y -= size.y / 2));
        });
        break;
      case 'fu_4': // 연료 밀도화 -> 연기 과다
        add(EffectsFactory.createVaporEffect(position: Vector2(size.x / 2, size.y / 2)));
        add(EffectsFactory.createVaporEffect(position: Vector2(size.x / 2, 0)));
        break;

      // Ignition Failures
      case 'ig_1': // 일제 점화 -> 파편 파티클
        parent?.add(EffectsFactory.createExplosion(position: position.clone()));
        break;
      case 'ig_2': // 물 분사 -> 파편 파티클
        parent?.add(EffectsFactory.createSparks(position: position.clone(), color: Colors.grey));
        break;
      case 'ig_3': // 터보펌프 시동 -> 엔진 폭발
        parent?.add(EffectsFactory.createExplosion(position: position.clone()));
        break;

      // Liftoff
      case 'li_1': // 클램프 해제 -> 주저앉아 대폭발
        add(MoveEffect.by(Vector2(0, -20), EffectController(duration: 0.5)));
        Future.delayed(const Duration(milliseconds: 500), () {
          add(MoveEffect.by(Vector2(0, 20), EffectController(duration: 0.2)));
          parent?.add(EffectsFactory.createExplosion(position: position.clone()));
        });
        break;
      
      default:
        parent?.add(EffectsFactory.createExplosion(position: position.clone()));
        break;
    }
  }

  void resetToStage(LaunchStage stage) {
    isFailed = false;
    currentStage = stage;
    velocity = Vector2.zero();
    thrust = 0.0;
    isStaged = false;
    
    // 이펙트 초기화
    removeAll(children.whereType<Effect>());
    secondStage.removeAll(secondStage.children.whereType<Effect>());
    
    firstStage.position = Vector2(0, size.y * 0.3);
    secondStage.position = Vector2(0, 0);
    scale = Vector2.all(1.0);

    if (activeVapor != null) {
      activeVapor!.removeFromParent();
      activeVapor = null;
    }

    // 단계별 상태 초기화
    if (stage == LaunchStage.rollout) {
      position = vabPosition.clone();
      angle = -pi / 2;
      crewArm.isConnected = false;
      crewArm.width = 0;
    } else if (stage == LaunchStage.erecting) {
      position = launchPadPosition.clone();
      angle = -pi / 2;
      crewArm.isConnected = false;
    } else {
      position = launchPadPosition.clone();
      angle = 0; // 서있는 상태
      
      if (stage == LaunchStage.boarding) {
        crewArm.isConnected = true;
      } else if (stage == LaunchStage.fueling) {
        crewArm.isConnected = true;
        activeVapor = EffectsFactory.createVaporEffect(position: Vector2(size.x / 2, size.y));
        add(activeVapor!);
      } else if (stage == LaunchStage.ignition) {
        crewArm.isConnected = false;
      }
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isFailed) return;

    if (currentStage == LaunchStage.rollout) {
      // 발사대 쪽으로 x 이동
      if (position.x < launchPadPosition.x) {
        position.x += 20 * dt; // 천천히 이동
        if (position.x > launchPadPosition.x) {
          position.x = launchPadPosition.x;
        }
      }
    } else if (currentStage == LaunchStage.erecting) {
      // 수직으로 회전
      if (angle < 0) {
        angle += (pi / 4) * dt; // 천천히 회전
        if (angle > 0) angle = 0;
      }
    }

    if (currentStage == LaunchStage.liftoff || currentStage == LaunchStage.staging || 
        currentStage == LaunchStage.descent || currentStage == LaunchStage.landing) {
      
      if (!isStaged) {
        velocity.y += (gravity + thrust) * dt;
        position += velocity * dt;
      } else {
        velocity.y += (gravity + thrust) * dt;
        if (currentStage == LaunchStage.landing && velocity.y < 0) {
           velocity.y = 10;
        }
        position += velocity * dt;
        secondStage.position.y -= 300 * dt; 
      }
    }
  }
}
