import 'package:freezed_annotation/freezed_annotation.dart';
import 'launch_mode.dart';
import 'launch_stage.dart';
import 'checklist_item.dart';

part 'simulation_state.freezed.dart';
part 'simulation_state.g.dart';

@freezed
sealed class SimulationState with _$SimulationState {
  const factory SimulationState({
    @Default(LaunchMode.full) LaunchMode currentMode,
    @Default(LaunchStage.rollout) LaunchStage currentStage,
    @Default([]) List<ChecklistItem> checklists,
    @Default(false) bool isFailed,
    String? failureMessage,
    String? failedChecklistId,
  }) = _SimulationState;

  factory SimulationState.fromJson(Map<String, Object?> json) =>
      _$SimulationStateFromJson(json);
}
