import 'package:freezed_annotation/freezed_annotation.dart';
import 'launch_stage.dart';

part 'checklist_item.freezed.dart';
part 'checklist_item.g.dart';

@freezed
sealed class ChecklistChoice with _$ChecklistChoice {
  const factory ChecklistChoice({
    required String label,
    required bool isCorrect,
    String? failureMessage,
  }) = _ChecklistChoice;

  factory ChecklistChoice.fromJson(Map<String, Object?> json) => _$ChecklistChoiceFromJson(json);
}

@freezed
sealed class ChecklistItem with _$ChecklistItem {
  const factory ChecklistItem({
    required String id,
    required LaunchStage targetStage,
    required String description,
    @Default([]) List<ChecklistChoice> choices,
    @Default(false) bool isCompleted,
  }) = _ChecklistItem;

  factory ChecklistItem.fromJson(Map<String, Object?> json) =>
      _$ChecklistItemFromJson(json);
}
