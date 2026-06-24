// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'simulation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SimulationState {

 LaunchMode get currentMode; LaunchStage get currentStage; List<ChecklistItem> get checklists; bool get isFailed; String? get failureMessage; String? get failedChecklistId;
/// Create a copy of SimulationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SimulationStateCopyWith<SimulationState> get copyWith => _$SimulationStateCopyWithImpl<SimulationState>(this as SimulationState, _$identity);

  /// Serializes this SimulationState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SimulationState&&(identical(other.currentMode, currentMode) || other.currentMode == currentMode)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&const DeepCollectionEquality().equals(other.checklists, checklists)&&(identical(other.isFailed, isFailed) || other.isFailed == isFailed)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage)&&(identical(other.failedChecklistId, failedChecklistId) || other.failedChecklistId == failedChecklistId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentMode,currentStage,const DeepCollectionEquality().hash(checklists),isFailed,failureMessage,failedChecklistId);

@override
String toString() {
  return 'SimulationState(currentMode: $currentMode, currentStage: $currentStage, checklists: $checklists, isFailed: $isFailed, failureMessage: $failureMessage, failedChecklistId: $failedChecklistId)';
}


}

/// @nodoc
abstract mixin class $SimulationStateCopyWith<$Res>  {
  factory $SimulationStateCopyWith(SimulationState value, $Res Function(SimulationState) _then) = _$SimulationStateCopyWithImpl;
@useResult
$Res call({
 LaunchMode currentMode, LaunchStage currentStage, List<ChecklistItem> checklists, bool isFailed, String? failureMessage, String? failedChecklistId
});




}
/// @nodoc
class _$SimulationStateCopyWithImpl<$Res>
    implements $SimulationStateCopyWith<$Res> {
  _$SimulationStateCopyWithImpl(this._self, this._then);

  final SimulationState _self;
  final $Res Function(SimulationState) _then;

/// Create a copy of SimulationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentMode = null,Object? currentStage = null,Object? checklists = null,Object? isFailed = null,Object? failureMessage = freezed,Object? failedChecklistId = freezed,}) {
  return _then(_self.copyWith(
currentMode: null == currentMode ? _self.currentMode : currentMode // ignore: cast_nullable_to_non_nullable
as LaunchMode,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as LaunchStage,checklists: null == checklists ? _self.checklists : checklists // ignore: cast_nullable_to_non_nullable
as List<ChecklistItem>,isFailed: null == isFailed ? _self.isFailed : isFailed // ignore: cast_nullable_to_non_nullable
as bool,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,failedChecklistId: freezed == failedChecklistId ? _self.failedChecklistId : failedChecklistId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SimulationState].
extension SimulationStatePatterns on SimulationState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SimulationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SimulationState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SimulationState value)  $default,){
final _that = this;
switch (_that) {
case _SimulationState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SimulationState value)?  $default,){
final _that = this;
switch (_that) {
case _SimulationState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LaunchMode currentMode,  LaunchStage currentStage,  List<ChecklistItem> checklists,  bool isFailed,  String? failureMessage,  String? failedChecklistId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SimulationState() when $default != null:
return $default(_that.currentMode,_that.currentStage,_that.checklists,_that.isFailed,_that.failureMessage,_that.failedChecklistId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LaunchMode currentMode,  LaunchStage currentStage,  List<ChecklistItem> checklists,  bool isFailed,  String? failureMessage,  String? failedChecklistId)  $default,) {final _that = this;
switch (_that) {
case _SimulationState():
return $default(_that.currentMode,_that.currentStage,_that.checklists,_that.isFailed,_that.failureMessage,_that.failedChecklistId);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LaunchMode currentMode,  LaunchStage currentStage,  List<ChecklistItem> checklists,  bool isFailed,  String? failureMessage,  String? failedChecklistId)?  $default,) {final _that = this;
switch (_that) {
case _SimulationState() when $default != null:
return $default(_that.currentMode,_that.currentStage,_that.checklists,_that.isFailed,_that.failureMessage,_that.failedChecklistId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SimulationState implements SimulationState {
  const _SimulationState({this.currentMode = LaunchMode.full, this.currentStage = LaunchStage.rollout, final  List<ChecklistItem> checklists = const [], this.isFailed = false, this.failureMessage, this.failedChecklistId}): _checklists = checklists;
  factory _SimulationState.fromJson(Map<String, dynamic> json) => _$SimulationStateFromJson(json);

@override@JsonKey() final  LaunchMode currentMode;
@override@JsonKey() final  LaunchStage currentStage;
 final  List<ChecklistItem> _checklists;
@override@JsonKey() List<ChecklistItem> get checklists {
  if (_checklists is EqualUnmodifiableListView) return _checklists;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_checklists);
}

@override@JsonKey() final  bool isFailed;
@override final  String? failureMessage;
@override final  String? failedChecklistId;

/// Create a copy of SimulationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SimulationStateCopyWith<_SimulationState> get copyWith => __$SimulationStateCopyWithImpl<_SimulationState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SimulationStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SimulationState&&(identical(other.currentMode, currentMode) || other.currentMode == currentMode)&&(identical(other.currentStage, currentStage) || other.currentStage == currentStage)&&const DeepCollectionEquality().equals(other._checklists, _checklists)&&(identical(other.isFailed, isFailed) || other.isFailed == isFailed)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage)&&(identical(other.failedChecklistId, failedChecklistId) || other.failedChecklistId == failedChecklistId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currentMode,currentStage,const DeepCollectionEquality().hash(_checklists),isFailed,failureMessage,failedChecklistId);

@override
String toString() {
  return 'SimulationState(currentMode: $currentMode, currentStage: $currentStage, checklists: $checklists, isFailed: $isFailed, failureMessage: $failureMessage, failedChecklistId: $failedChecklistId)';
}


}

/// @nodoc
abstract mixin class _$SimulationStateCopyWith<$Res> implements $SimulationStateCopyWith<$Res> {
  factory _$SimulationStateCopyWith(_SimulationState value, $Res Function(_SimulationState) _then) = __$SimulationStateCopyWithImpl;
@override @useResult
$Res call({
 LaunchMode currentMode, LaunchStage currentStage, List<ChecklistItem> checklists, bool isFailed, String? failureMessage, String? failedChecklistId
});




}
/// @nodoc
class __$SimulationStateCopyWithImpl<$Res>
    implements _$SimulationStateCopyWith<$Res> {
  __$SimulationStateCopyWithImpl(this._self, this._then);

  final _SimulationState _self;
  final $Res Function(_SimulationState) _then;

/// Create a copy of SimulationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentMode = null,Object? currentStage = null,Object? checklists = null,Object? isFailed = null,Object? failureMessage = freezed,Object? failedChecklistId = freezed,}) {
  return _then(_SimulationState(
currentMode: null == currentMode ? _self.currentMode : currentMode // ignore: cast_nullable_to_non_nullable
as LaunchMode,currentStage: null == currentStage ? _self.currentStage : currentStage // ignore: cast_nullable_to_non_nullable
as LaunchStage,checklists: null == checklists ? _self._checklists : checklists // ignore: cast_nullable_to_non_nullable
as List<ChecklistItem>,isFailed: null == isFailed ? _self.isFailed : isFailed // ignore: cast_nullable_to_non_nullable
as bool,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,failedChecklistId: freezed == failedChecklistId ? _self.failedChecklistId : failedChecklistId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
