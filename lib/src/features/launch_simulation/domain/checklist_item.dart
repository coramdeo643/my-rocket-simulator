import 'package:freezed_annotation/freezed_annotation.dart';
import 'launch_stage.dart';

part 'checklist_item.freezed.dart';
part 'checklist_item.g.dart';

@freezed
sealed class ChecklistItem with _$ChecklistItem {
  const factory ChecklistItem({
    required String id,
    required LaunchStage targetStage,
    required String description,
    @Default(false) bool isCompleted,
  }) = _ChecklistItem;

  factory ChecklistItem.fromJson(Map<String, Object?> json) =>
      _$ChecklistItemFromJson(json);
}
