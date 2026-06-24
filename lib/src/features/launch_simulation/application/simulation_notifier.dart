import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/checklist_data.dart';
import '../domain/launch_stage.dart';
import '../domain/simulation_state.dart';
import '../domain/launch_mode.dart';

class SimulationNotifier extends Notifier<SimulationState> {
  SimulationState? _checkpointState;

  @override
  SimulationState build() {
    final initialState = SimulationState(checklists: initialChecklists);
    _checkpointState = initialState;
    return initialState;
  }

  void selectChoice(String itemId, int choiceIndex) {
    if (state.isFailed) return;

    final itemIndex = state.checklists.indexWhere((item) => item.id == itemId);
    if (itemIndex == -1) return;

    final item = state.checklists[itemIndex];
    if (item.choices.isEmpty) {
      // No choices, just mark complete
      _markItemCompleted(itemId);
      return;
    }

    final choice = item.choices[choiceIndex];
    if (choice.isCorrect) {
      _markItemCompleted(itemId);
    } else {
      // Failed!
      state = state.copyWith(
        isFailed: true,
        failureMessage: choice.failureMessage ?? '선택 오류로 인해 시뮬레이션이 중단되었습니다.',
        failedChecklistId: itemId,
      );
    }
  }

  // Fallback for items without choices
  void toggleChecklistItem(String id) {
    if (state.isFailed) return;
    
    final item = state.checklists.firstWhere((item) => item.id == id);
    if (item.choices.isNotEmpty) return; // Should use selectChoice instead

    final updatedChecklists = state.checklists.map((item) {
      if (item.id == id) {
        return item.copyWith(isCompleted: !item.isCompleted);
      }
      return item;
    }).toList();

    state = state.copyWith(checklists: updatedChecklists);
    _evaluateStageTransition();
  }

  void _markItemCompleted(String id) {
    final updatedChecklists = state.checklists.map((item) {
      if (item.id == id) {
        return item.copyWith(isCompleted: true);
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
      // Save checkpoint for the new stage
      _checkpointState = state;
    }
  }

  void retryCheckpoint() {
    if (_checkpointState != null) {
      state = _checkpointState!;
    } else {
      reset();
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
      isFailed: false,
      failureMessage: null,
      failedChecklistId: null,
    );
    _checkpointState = state;
  }
  
  void reset() {
    state = SimulationState(checklists: initialChecklists);
    _checkpointState = state;
  }
}

final simulationProvider = NotifierProvider<SimulationNotifier, SimulationState>(() {
  return SimulationNotifier();
});
