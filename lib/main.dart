import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/features/launch_simulation/presentation/launch_simulator_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // 시뮬레이터 뷰 확보를 위해 앱을 가로 모드로 고정합니다.
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(
      // Riverpod 상태 관리를 위해 ProviderScope로 앱을 감쌉니다.
      const ProviderScope(
        child: RocketSimulatorApp(),
      ),
    );
  });
}

class RocketSimulatorApp extends StatelessWidget {
  const RocketSimulatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2D Rocket Simulator',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const LaunchSimulatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
