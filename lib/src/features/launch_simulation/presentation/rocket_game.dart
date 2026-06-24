import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import '../domain/launch_stage.dart';
import 'components/background_component.dart';
import 'components/launch_pad_component.dart';
import 'components/drone_ship_component.dart';
import 'components/rocket_component.dart';
import 'components/vab_component.dart';
import 'components/crew_arm_component.dart';

class RocketGame extends FlameGame {
  late BackgroundComponent background;
  late VABComponent vab;
  late LaunchPadComponent launchPad;
  late CrewArmComponent crewArm;
  late DroneShipComponent droneShip;
  late RocketComponent rocket;

  LaunchStage currentStage = LaunchStage.rollout;

  @override
  Future<void> onLoad() async {
    final worldHeight = size.y * 5;

    background = BackgroundComponent()
      ..size = Vector2(size.x * 2, worldHeight);
    world.add(background);

    // VAB 조립동 (좌측 화면 밖/끝)
    vab = VABComponent(
      position: Vector2(-size.x * 0.2, worldHeight - 350),
      size: Vector2(300, 350),
    );
    world.add(vab);

    droneShip = DroneShipComponent(
      position: Vector2(size.x * 1.2, worldHeight - 150),
      size: Vector2(250, 50),
    );
    world.add(droneShip);

    launchPad = LaunchPadComponent(
      position: Vector2(size.x * 0.4, worldHeight - 350),
      size: Vector2(120, 250),
    );
    world.add(launchPad);

    crewArm = CrewArmComponent(
      position: Vector2(size.x * 0.4 + 35, worldHeight - 330), // 타워 부근에서
      size: Vector2(50, 10), // 높이는 얇게
    );
    crewArm.targetWidth = 40.0;
    world.add(crewArm);

    // 로켓은 초기에 VAB 부근에 누워있음
    rocket = RocketComponent(
      position: Vector2(-size.x * 0.1, worldHeight - 150),
      size: Vector2(50, 200),
      launchPadPosition: Vector2(size.x * 0.4 + 35, worldHeight - 350),
      crewArm: crewArm,
    );
    world.add(rocket);

    // 초기 카메라: 발사대와 조립동 사이를 비추는 고정 뷰
    camera.viewfinder.position = Vector2(size.x * 0.2, worldHeight - 200);
    camera.viewfinder.anchor = Anchor.center;
  }

  void updateSimulationStage(LaunchStage stage) {
    if (currentStage == stage) return;
    currentStage = stage;
    rocket.updateStage(stage);

    if (stage == LaunchStage.liftoff) {
      // 이륙 시 카메라가 로켓을 추적하도록 변경
      camera.follow(rocket);
    }

    if (stage == LaunchStage.descent) {
      rocket.velocity.x = 120.0;
    }
  }

  void triggerFailure(String? failedId) {
    rocket.triggerFailure(failedId);
    
    // 특정 실패는 카메라 흔들림 유발
    if (failedId == 'er_1' || failedId == 'ig_2' || failedId == 'li_1') {
      camera.viewfinder.add(
        MoveEffect.by(
          Vector2(10, 10),
          EffectController(duration: 0.05, reverseDuration: 0.05, repeatCount: 5),
        ),
      );
    }
  }

  void resetToStage(LaunchStage stage) {
    currentStage = stage;
    // 카메라 초기화
    camera.stop();
    camera.viewfinder.position = Vector2(size.x * 0.2, size.y * 5 - 200);
    
    rocket.resetToStage(stage);
  }
}
