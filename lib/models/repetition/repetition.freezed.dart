// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repetition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Repetition _$RepetitionFromJson(Map<String, dynamic> json) {
  return _Repetition.fromJson(json);
}

/// @nodoc
mixin _$Repetition {
  int get id => throw _privateConstructorUsedError;
  int get taskId => throw _privateConstructorUsedError;
  String get repeatType => throw _privateConstructorUsedError;
  int get repeatValue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepetitionCopyWith<Repetition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepetitionCopyWith<$Res> {
  factory $RepetitionCopyWith(
          Repetition value, $Res Function(Repetition) then) =
      _$RepetitionCopyWithImpl<$Res, Repetition>;
  @useResult
  $Res call({int id, int taskId, String repeatType, int repeatValue});
}

/// @nodoc
class _$RepetitionCopyWithImpl<$Res, $Val extends Repetition>
    implements $RepetitionCopyWith<$Res> {
  _$RepetitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? repeatType = null,
    Object? repeatValue = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      repeatType: null == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as String,
      repeatValue: null == repeatValue
          ? _value.repeatValue
          : repeatValue // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RepetitionImplCopyWith<$Res>
    implements $RepetitionCopyWith<$Res> {
  factory _$$RepetitionImplCopyWith(
          _$RepetitionImpl value, $Res Function(_$RepetitionImpl) then) =
      __$$RepetitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int taskId, String repeatType, int repeatValue});
}

/// @nodoc
class __$$RepetitionImplCopyWithImpl<$Res>
    extends _$RepetitionCopyWithImpl<$Res, _$RepetitionImpl>
    implements _$$RepetitionImplCopyWith<$Res> {
  __$$RepetitionImplCopyWithImpl(
      _$RepetitionImpl _value, $Res Function(_$RepetitionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? repeatType = null,
    Object? repeatValue = null,
  }) {
    return _then(_$RepetitionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      repeatType: null == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as String,
      repeatValue: null == repeatValue
          ? _value.repeatValue
          : repeatValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RepetitionImpl implements _Repetition {
  const _$RepetitionImpl(
      {required this.id,
      required this.taskId,
      required this.repeatType,
      required this.repeatValue});

  factory _$RepetitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$RepetitionImplFromJson(json);

  @override
  final int id;
  @override
  final int taskId;
  @override
  final String repeatType;
  @override
  final int repeatValue;

  @override
  String toString() {
    return 'Repetition(id: $id, taskId: $taskId, repeatType: $repeatType, repeatValue: $repeatValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RepetitionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.repeatType, repeatType) ||
                other.repeatType == repeatType) &&
            (identical(other.repeatValue, repeatValue) ||
                other.repeatValue == repeatValue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, taskId, repeatType, repeatValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RepetitionImplCopyWith<_$RepetitionImpl> get copyWith =>
      __$$RepetitionImplCopyWithImpl<_$RepetitionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RepetitionImplToJson(
      this,
    );
  }
}

abstract class _Repetition implements Repetition {
  const factory _Repetition(
      {required final int id,
      required final int taskId,
      required final String repeatType,
      required final int repeatValue}) = _$RepetitionImpl;

  factory _Repetition.fromJson(Map<String, dynamic> json) =
      _$RepetitionImpl.fromJson;

  @override
  int get id;
  @override
  int get taskId;
  @override
  String get repeatType;
  @override
  int get repeatValue;
  @override
  @JsonKey(ignore: true)
  _$$RepetitionImplCopyWith<_$RepetitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
