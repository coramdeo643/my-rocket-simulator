import 'package:flame/game.dart';

import '../domain/launch_stage.dart';
import 'components/background_component.dart';
import 'components/launch_pad_component.dart';
import 'components/drone_ship_component.dart';
import 'components/rocket_component.dart';

class RocketGame extends FlameGame {
  late BackgroundComponent background;
  late LaunchPadComponent launchPad;
  late DroneShipComponent droneShip;
  late RocketComponent rocket;

  LaunchStage currentStage = LaunchStage.rollout;

  @override
  Future<void> onLoad() async {
    final worldHeight = size.y * 5;

    background = BackgroundComponent()
      ..size = Vector2(size.x * 2, worldHeight);
    world.add(background);

    droneShip = DroneShipComponent(
      position: Vector2(size.x * 1.2, worldHeight - 150),
      size: Vector2(250, 50),
    );
    world.add(droneShip);

    launchPad = LaunchPadComponent(
      position: Vector2(size.x * 0.2, worldHeight - 350),
      size: Vector2(120, 250),
    );
    world.add(launchPad);

    rocket = RocketComponent(
      position: Vector2(size.x * 0.2 + 35, worldHeight - 350),
      size: Vector2(50, 200),
    );
    world.add(rocket);

    // Flame v1.x 최신 카메??추적 API
    camera.follow(rocket);
  }

  void updateSimulationStage(LaunchStage stage) {
    if (currentStage == stage) return;
    currentStage = stage;
    rocket.updateStage(stage);

    if (stage == LaunchStage.descent) {
      rocket.velocity.x = 120.0;
    }
  }
}
