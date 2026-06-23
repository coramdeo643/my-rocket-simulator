// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChecklistItem _$ChecklistItemFromJson(Map<String, dynamic> json) =>
    _ChecklistItem(
      id: json['id'] as String,
      targetStage: $enumDecode(_$LaunchStageEnumMap, json['targetStage']),
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$ChecklistItemToJson(_ChecklistItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'targetStage': _$LaunchStageEnumMap[instance.targetStage]!,
      'description': instance.description,
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
