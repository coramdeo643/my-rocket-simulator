// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistChoice _$ChecklistChoiceFromJson(Map<String, dynamic> json) =>
    _ChecklistChoice(
      label: json['label'] as String,
      isCorrect: json['isCorrect'] as bool,
      failureMessage: json['failureMessage'] as String?,
    );

Map<String, dynamic> _$ChecklistChoiceToJson(_ChecklistChoice instance) =>
    <String, dynamic>{
      'label': instance.label,
      'isCorrect': instance.isCorrect,
      'failureMessage': instance.failureMessage,
    };

_ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) =>
    _ChecklistItem(
      id: json['id'] as String,
      targetStage: $enumDecode(_$LaunchStageEnumMap, json['targetStage']),
      description: json['description'] as String,
      choices:
          (json['choices'] as List<dynamic>?)
              ?.map((e) => ChecklistChoice.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ChecklistItemToJson(_ChecklistItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'targetStage': _$LaunchStageEnumMap[instance.targetStage]!,
      'description': instance.description,
      'choices': instance.choices,
      'isCompleted': instance.isCompleted,
    };

const _$LaunchStageEnumMap = {
  LaunchStage.rollout: 'rollout',
  LaunchStage.erecting: 'erecting',
  LaunchStage.boarding: 'boarding',
  LaunchStage.fueling: 'fueling',
  LaunchStage.ignition: 'ignition',
  LaunchStage.liftoff: 'liftoff',
  LaunchStage.staging: 'staging',
  LaunchStage.descent: 'descent',
  LaunchStage.landing: 'landing',
};
