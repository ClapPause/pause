// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_repeat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskRepeat _$TaskRepeatFromJson(Map<String, dynamic> json) {
  return _TaskRepeat.fromJson(json);
}

/// @nodoc
mixin _$TaskRepeat {
  int get id => throw _privateConstructorUsedError;
  int get repetitionId => throw _privateConstructorUsedError;
  String get timeStamp => throw _privateConstructorUsedError;
  bool get finish => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskRepeatCopyWith<TaskRepeat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskRepeatCopyWith<$Res> {
  factory $TaskRepeatCopyWith(
          TaskRepeat value, $Res Function(TaskRepeat) then) =
      _$TaskRepeatCopyWithImpl<$Res, TaskRepeat>;
  @useResult
  $Res call({int id, int repetitionId, String timeStamp, bool finish});
}

/// @nodoc
class _$TaskRepeatCopyWithImpl<$Res, $Val extends TaskRepeat>
    implements $TaskRepeatCopyWith<$Res> {
  _$TaskRepeatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repetitionId = null,
    Object? timeStamp = null,
    Object? finish = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      repetitionId: null == repetitionId
          ? _value.repetitionId
          : repetitionId // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskRepeatImplCopyWith<$Res>
    implements $TaskRepeatCopyWith<$Res> {
  factory _$$TaskRepeatImplCopyWith(
          _$TaskRepeatImpl value, $Res Function(_$TaskRepeatImpl) then) =
      __$$TaskRepeatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int repetitionId, String timeStamp, bool finish});
}

/// @nodoc
class __$$TaskRepeatImplCopyWithImpl<$Res>
    extends _$TaskRepeatCopyWithImpl<$Res, _$TaskRepeatImpl>
    implements _$$TaskRepeatImplCopyWith<$Res> {
  __$$TaskRepeatImplCopyWithImpl(
      _$TaskRepeatImpl _value, $Res Function(_$TaskRepeatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? repetitionId = null,
    Object? timeStamp = null,
    Object? finish = null,
  }) {
    return _then(_$TaskRepeatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      repetitionId: null == repetitionId
          ? _value.repetitionId
          : repetitionId // ignore: cast_nullable_to_non_nullable
              as int,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as String,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskRepeatImpl implements _TaskRepeat {
  const _$TaskRepeatImpl(
      {required this.id,
      required this.repetitionId,
      required this.timeStamp,
      required this.finish});

  factory _$TaskRepeatImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskRepeatImplFromJson(json);

  @override
  final int id;
  @override
  final int repetitionId;
  @override
  final String timeStamp;
  @override
  final bool finish;

  @override
  String toString() {
    return 'TaskRepeat(id: $id, repetitionId: $repetitionId, timeStamp: $timeStamp, finish: $finish)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskRepeatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.repetitionId, repetitionId) ||
                other.repetitionId == repetitionId) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.finish, finish) || other.finish == finish));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, repetitionId, timeStamp, finish);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskRepeatImplCopyWith<_$TaskRepeatImpl> get copyWith =>
      __$$TaskRepeatImplCopyWithImpl<_$TaskRepeatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskRepeatImplToJson(
      this,
    );
  }
}

abstract class _TaskRepeat implements TaskRepeat {
  const factory _TaskRepeat(
      {required final int id,
      required final int repetitionId,
      required final String timeStamp,
      required final bool finish}) = _$TaskRepeatImpl;

  factory _TaskRepeat.fromJson(Map<String, dynamic> json) =
      _$TaskRepeatImpl.fromJson;

  @override
  int get id;
  @override
  int get repetitionId;
  @override
  String get timeStamp;
  @override
  bool get finish;
  @override
  @JsonKey(ignore: true)
  _$$TaskRepeatImplCopyWith<_$TaskRepeatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
