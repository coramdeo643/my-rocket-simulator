import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/checklist_data.dart';
import '../domain/launch_stage.dart';
import '../domain/simulation_state.dart';
import '../domain/launch_mode.dart';

class SimulationNotifier extends Notifier<SimulationState> {
  @override
  SimulationState build() {
    return SimulationState(checklists: initialChecklists);
  }

  void toggleChecklistItem(String id) {
    final updatedChecklists = state.checklists.map((item) {
      if (item.id == id) {
        return item.copyWith(isCompleted: !item.isCompleted);
      }
      return item;
    }).toList();

    state = state.copyWith(checklists: updatedChecklists);
    _evaluateStageTransition();
  }

  void _evaluateStageTransition() {
    final currentStage = state.currentStage;
    
    final stageItems = state.checklists
        .where((item) => item.targetStage == currentStage)
        .toList();

    if (stageItems.isNotEmpty && stageItems.every((item) => item.isCompleted)) {
      _moveToNextStage(currentStage);
    }
  }

  void _moveToNextStage(LaunchStage currentStage) {
    final stages = LaunchStage.values;
    final currentIndex = stages.indexOf(currentStage);
    
    if (currentIndex < stages.length - 1) {
      final nextStage = stages[currentIndex + 1];
      state = state.copyWith(currentStage: nextStage);
    }
  }

  void setQuickMode() {
    final updatedChecklists = state.checklists.map((item) {
      if (item.targetStage == LaunchStage.rollout ||
          item.targetStage == LaunchStage.erecting ||
          item.targetStage == LaunchStage.boarding) {
        return item.copyWith(isCompleted: true);
      }
      return item;
    }).toList();

    state = state.copyWith(
      currentMode: LaunchMode.quick,
      currentStage: LaunchStage.fueling,
      checklists: updatedChecklists,
    );
  }
  
  void reset() {
    state = SimulationState(checklists: initialChecklists);
  }
}

final simulationProvider = NotifierProvider<SimulationNotifier, SimulationState>(() {
  return SimulationNotifier();
});
