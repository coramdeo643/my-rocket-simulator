// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checklist_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChecklistChoice {

 String get label; bool get isCorrect; String? get failureMessage;
/// Create a copy of ChecklistChoice
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistChoiceCopyWith<ChecklistChoice> get copyWith => _$ChecklistChoiceCopyWithImpl<ChecklistChoice>(this as ChecklistChoice, _$identity);

  /// Serializes this ChecklistChoice to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistChoice&&(identical(other.label, label) || other.label == label)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,isCorrect,failureMessage);

@override
String toString() {
  return 'ChecklistChoice(label: $label, isCorrect: $isCorrect, failureMessage: $failureMessage)';
}


}

/// @nodoc
abstract mixin class $ChecklistChoiceCopyWith<$Res>  {
  factory $ChecklistChoiceCopyWith(ChecklistChoice value, $Res Function(ChecklistChoice) _then) = _$ChecklistChoiceCopyWithImpl;
@useResult
$Res call({
 String label, bool isCorrect, String? failureMessage
});




}
/// @nodoc
class _$ChecklistChoiceCopyWithImpl<$Res>
    implements $ChecklistChoiceCopyWith<$Res> {
  _$ChecklistChoiceCopyWithImpl(this._self, this._then);

  final ChecklistChoice _self;
  final $Res Function(ChecklistChoice) _then;

/// Create a copy of ChecklistChoice
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? isCorrect = null,Object? failureMessage = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistChoice].
extension ChecklistChoicePatterns on ChecklistChoice {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistChoice value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistChoice() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistChoice value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistChoice():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistChoice value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistChoice() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String label,  bool isCorrect,  String? failureMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistChoice() when $default != null:
return $default(_that.label,_that.isCorrect,_that.failureMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String label,  bool isCorrect,  String? failureMessage)  $default,) {final _that = this;
switch (_that) {
case _ChecklistChoice():
return $default(_that.label,_that.isCorrect,_that.failureMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String label,  bool isCorrect,  String? failureMessage)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistChoice() when $default != null:
return $default(_that.label,_that.isCorrect,_that.failureMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChecklistChoice implements ChecklistChoice {
  const _ChecklistChoice({required this.label, required this.isCorrect, this.failureMessage});
  factory _ChecklistChoice.fromJson(Map<String, dynamic> json) => _$ChecklistChoiceFromJson(json);

@override final  String label;
@override final  bool isCorrect;
@override final  String? failureMessage;

/// Create a copy of ChecklistChoice
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistChoiceCopyWith<_ChecklistChoice> get copyWith => __$ChecklistChoiceCopyWithImpl<_ChecklistChoice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistChoiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistChoice&&(identical(other.label, label) || other.label == label)&&(identical(other.isCorrect, isCorrect) || other.isCorrect == isCorrect)&&(identical(other.failureMessage, failureMessage) || other.failureMessage == failureMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,isCorrect,failureMessage);

@override
String toString() {
  return 'ChecklistChoice(label: $label, isCorrect: $isCorrect, failureMessage: $failureMessage)';
}


}

/// @nodoc
abstract mixin class _$ChecklistChoiceCopyWith<$Res> implements $ChecklistChoiceCopyWith<$Res> {
  factory _$ChecklistChoiceCopyWith(_ChecklistChoice value, $Res Function(_ChecklistChoice) _then) = __$ChecklistChoiceCopyWithImpl;
@override @useResult
$Res call({
 String label, bool isCorrect, String? failureMessage
});




}
/// @nodoc
class __$ChecklistChoiceCopyWithImpl<$Res>
    implements _$ChecklistChoiceCopyWith<$Res> {
  __$ChecklistChoiceCopyWithImpl(this._self, this._then);

  final _ChecklistChoice _self;
  final $Res Function(_ChecklistChoice) _then;

/// Create a copy of ChecklistChoice
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? isCorrect = null,Object? failureMessage = freezed,}) {
  return _then(_ChecklistChoice(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,isCorrect: null == isCorrect ? _self.isCorrect : isCorrect // ignore: cast_nullable_to_non_nullable
as bool,failureMessage: freezed == failureMessage ? _self.failureMessage : failureMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChecklistItem {

 String get id; LaunchStage get targetStage; String get description; List<ChecklistChoice> get choices; bool get isCompleted;
/// Create a copy of ChecklistItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistItemCopyWith<ChecklistItem> get copyWith => _$ChecklistItemCopyWithImpl<ChecklistItem>(this as ChecklistItem, _$identity);

  /// Serializes this ChecklistItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.targetStage, targetStage) || other.targetStage == targetStage)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.choices, choices)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,targetStage,description,const DeepCollectionEquality().hash(choices),isCompleted);

@override
String toString() {
  return 'ChecklistItem(id: $id, targetStage: $targetStage, description: $description, choices: $choices, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $ChecklistItemCopyWith<$Res>  {
  factory $ChecklistItemCopyWith(ChecklistItem value, $Res Function(ChecklistItem) _then) = _$ChecklistItemCopyWithImpl;
@useResult
$Res call({
 String id, LaunchStage targetStage, String description, List<ChecklistChoice> choices, bool isCompleted
});




}
/// @nodoc
class _$ChecklistItemCopyWithImpl<$Res>
    implements $ChecklistItemCopyWith<$Res> {
  _$ChecklistItemCopyWithImpl(this._self, this._then);

  final ChecklistItem _self;
  final $Res Function(ChecklistItem) _then;

/// Create a copy of ChecklistItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? targetStage = null,Object? description = null,Object? choices = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,targetStage: null == targetStage ? _self.targetStage : targetStage // ignore: cast_nullable_to_non_nullable
as LaunchStage,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<ChecklistChoice>,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistItem].
extension ChecklistItemPatterns on ChecklistItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistItem value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistItem value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LaunchStage targetStage,  String description,  List<ChecklistChoice> choices,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistItem() when $default != null:
return $default(_that.id,_that.targetStage,_that.description,_that.choices,_that.isCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LaunchStage targetStage,  String description,  List<ChecklistChoice> choices,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _ChecklistItem():
return $default(_that.id,_that.targetStage,_that.description,_that.choices,_that.isCompleted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LaunchStage targetStage,  String description,  List<ChecklistChoice> choices,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistItem() when $default != null:
return $default(_that.id,_that.targetStage,_that.description,_that.choices,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChecklistItem implements ChecklistItem {
  const _ChecklistItem({required this.id, required this.targetStage, required this.description, final  List<ChecklistChoice> choices = const [], this.isCompleted = false}): _choices = choices;
  factory _ChecklistItem.fromJson(Map<String, dynamic> json) => _$ChecklistItemFromJson(json);

@override final  String id;
@override final  LaunchStage targetStage;
@override final  String description;
 final  List<ChecklistChoice> _choices;
@override@JsonKey() List<ChecklistChoice> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}

@override@JsonKey() final  bool isCompleted;

/// Create a copy of ChecklistItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistItemCopyWith<_ChecklistItem> get copyWith => __$ChecklistItemCopyWithImpl<_ChecklistItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.targetStage, targetStage) || other.targetStage == targetStage)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._choices, _choices)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,targetStage,description,const DeepCollectionEquality().hash(_choices),isCompleted);

@override
String toString() {
  return 'ChecklistItem(id: $id, targetStage: $targetStage, description: $description, choices: $choices, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$ChecklistItemCopyWith<$Res> implements $ChecklistItemCopyWith<$Res> {
  factory _$ChecklistItemCopyWith(_ChecklistItem value, $Res Function(_ChecklistItem) _then) = __$ChecklistItemCopyWithImpl;
@override @useResult
$Res call({
 String id, LaunchStage targetStage, String description, List<ChecklistChoice> choices, bool isCompleted
});




}
/// @nodoc
class __$ChecklistItemCopyWithImpl<$Res>
    implements _$ChecklistItemCopyWith<$Res> {
  __$ChecklistItemCopyWithImpl(this._self, this._then);

  final _ChecklistItem _self;
  final $Res Function(_ChecklistItem) _then;

/// Create a copy of ChecklistItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? targetStage = null,Object? description = null,Object? choices = null,Object? isCompleted = null,}) {
  return _then(_ChecklistItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,targetStage: null == targetStage ? _self.targetStage : targetStage // ignore: cast_nullable_to_non_nullable
as LaunchStage,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<ChecklistChoice>,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
