import 'package:flame/components.dart';
import '../../domain/launch_stage.dart';
import 'first_stage_component.dart';
import 'second_stage_component.dart';

class RocketComponent extends PositionComponent {
  late FirstStageComponent firstStage;
  late SecondStageComponent secondStage;

  LaunchStage currentStage = LaunchStage.rollout;

  // 물리 시뮬레이션용 파라미터
  Vector2 velocity = Vector2.zero();
  double gravity = 300.0; // 픽셀 단위 중력
  double thrust = 0.0;
  
  bool isStaged = false;

  RocketComponent({required Vector2 position, required Vector2 size})
      : super(position: position, size: size, priority: 2) {
    
    firstStage = FirstStageComponent(size: Vector2(size.x, size.y * 0.7))
      ..position = Vector2(0, size.y * 0.3);
      
    secondStage = SecondStageComponent(size: Vector2(size.x, size.y * 0.3))
      ..position = Vector2(0, 0);

    add(firstStage);
    add(secondStage);
  }

  void updateStage(LaunchStage stage) {
    currentStage = stage;
    
    switch(stage) {
      case LaunchStage.rollout:
      case LaunchStage.erecting:
      case LaunchStage.boarding:
      case LaunchStage.fueling:
        thrust = 0;
        firstStage.engineOn = false;
        break;
      case LaunchStage.ignition:
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

  @override
  void update(double dt) {
    super.update(dt);

    if (currentStage == LaunchStage.liftoff || currentStage == LaunchStage.staging || 
        currentStage == LaunchStage.descent || currentStage == LaunchStage.landing) {
      
      if (!isStaged) {
        // 합체 상태 (이륙)
        velocity.y += (gravity + thrust) * dt;
        position += velocity * dt;
      } else {
        // 단 분리 이후: 1단과 2단 분리 제어
        // RocketComponent의 Transform 자체는 1단을 추적한다고 설계 (카메라 추적의 용이성)
        velocity.y += (gravity + thrust) * dt;
        
        // 착륙 단계에서 너무 높이 튀어오르지 않게 속도 제어
        if (currentStage == LaunchStage.landing && velocity.y < 0) {
           velocity.y = 10; // 천천히 내려오게 보정
        }
        
        position += velocity * dt;
        
        // 2단 로켓은 별도로 화면 밖 상단으로 이탈시킴
        secondStage.position.y -= 300 * dt; 
      }
    }
  }
}
