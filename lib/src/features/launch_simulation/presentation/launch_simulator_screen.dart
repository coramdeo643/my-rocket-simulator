import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../application/simulation_notifier.dart';
import 'rocket_game.dart';
import 'widgets/checklist_panel.dart';
import '../domain/simulation_state.dart';

class LaunchSimulatorScreen extends ConsumerStatefulWidget {
  const LaunchSimulatorScreen({super.key});

  @override
  ConsumerState<LaunchSimulatorScreen> createState() => _LaunchSimulatorScreenState();
}

class _LaunchSimulatorScreenState extends ConsumerState<LaunchSimulatorScreen> {
  late final RocketGame _game;

  @override
  void initState() {
    super.initState();
    _game = RocketGame();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(simulationProvider);

    // 제네릭 타입을 명시하여 state.currentStage 참조 오류 해결
    ref.listen<SimulationState>(simulationProvider, (previous, next) {
      if (previous?.currentStage != next.currentStage) {
        _game.updateSimulationStage(next.currentStage);
      }
    });

    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 7,
            child: ClipRect(
              child: GameWidget(game: _game),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.blueGrey.shade900,
              child: Column(
                children: [
                  _buildHeader(),
                  Expanded(
                    child: ChecklistPanel(
                      currentStage: state.currentStage,
                      checklists: state.checklists,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.black45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'MISSION CONTROL',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.settings, color: Colors.white),
            onSelected: (value) {
              if (value == 'quick') {
                ref.read(simulationProvider.notifier).setQuickMode();
              } else if (value == 'reset') {
                ref.read(simulationProvider.notifier).reset();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'quick', child: Text('Quick Mode (발사 준비 직전)')),
              const PopupMenuItem(value: 'reset', child: Text('Reset (조립동부터 다시 시작)')),
            ],
          ),
        ],
      ),
    );
  }
}
