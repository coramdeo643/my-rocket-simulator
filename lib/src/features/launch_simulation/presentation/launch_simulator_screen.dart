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
      
      if (previous?.isFailed != true && next.isFailed == true) {
        // Trigger game animation
        _game.triggerFailure(next.failedChecklistId);
        
        // Wait briefly before showing dialog so animation plays
        Future.delayed(const Duration(seconds: 2), () {
          if (!mounted) return;
          _showFailureModal(next.failureMessage);
        });
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

  void _showFailureModal(String? message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.red.shade900,
          title: const Text('MISSION FAILED', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
          content: Text(message ?? '알 수 없는 오류 발생', style: const TextStyle(color: Colors.white, fontSize: 16)),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, foregroundColor: Colors.red.shade900),
              onPressed: () {
                Navigator.of(context).pop();
                ref.read(simulationProvider.notifier).retryCheckpoint();
                // We also need to tell the game to reset visually
                final currentState = ref.read(simulationProvider);
                _game.resetToStage(currentState.currentStage);
              },
              child: const Text('RETRY (체크포인트 복구)'),
            ),
          ],
        );
      },
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
