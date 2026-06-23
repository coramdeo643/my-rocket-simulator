// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simulation_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SimulationState _$SimulationStateFromJson(Map<String, dynamic> json) =>
    _SimulationState(
      currentMode:
          $enumDecodeNullable(_$LaunchModeEnumMap, json['currentMode']) ??
          LaunchMode.full,
      currentStage:
          $enumDecodeNullable(_$LaunchStageEnumMap, json['currentStage']) ??
          LaunchStage.rollout,
      checklists:
          (json['checklists'] as List<dynamic>?)
              ?.map((e) => ChecklistItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SimulationStateToJson(_SimulationState instance) =>
    <String, dynamic>{
      'currentMode': _$LaunchModeEnumMap[instance.currentMode]!,
      'currentStage': _$LaunchStageEnumMap[instance.currentStage]!,
      'checklists': instance.checklists,
    };

const _$LaunchModeEnumMap = {
  LaunchMode.full: 'full',
  LaunchMode.quick: 'quick',
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
