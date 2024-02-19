// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'life_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LifeGoal _$LifeGoalFromJson(Map<String, dynamic> json) {
  return _LifeGoal.fromJson(json);
}

/// @nodoc
mixin _$LifeGoal {
  int get id => throw _privateConstructorUsedError;
  int get uid => throw _privateConstructorUsedError;
  String get goal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LifeGoalCopyWith<LifeGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LifeGoalCopyWith<$Res> {
  factory $LifeGoalCopyWith(LifeGoal value, $Res Function(LifeGoal) then) =
      _$LifeGoalCopyWithImpl<$Res, LifeGoal>;
  @useResult
  $Res call({int id, int uid, String goal});
}

/// @nodoc
class _$LifeGoalCopyWithImpl<$Res, $Val extends LifeGoal>
    implements $LifeGoalCopyWith<$Res> {
  _$LifeGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? goal = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LifeGoalImplCopyWith<$Res>
    implements $LifeGoalCopyWith<$Res> {
  factory _$$LifeGoalImplCopyWith(
          _$LifeGoalImpl value, $Res Function(_$LifeGoalImpl) then) =
      __$$LifeGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int uid, String goal});
}

/// @nodoc
class __$$LifeGoalImplCopyWithImpl<$Res>
    extends _$LifeGoalCopyWithImpl<$Res, _$LifeGoalImpl>
    implements _$$LifeGoalImplCopyWith<$Res> {
  __$$LifeGoalImplCopyWithImpl(
      _$LifeGoalImpl _value, $Res Function(_$LifeGoalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? goal = null,
  }) {
    return _then(_$LifeGoalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LifeGoalImpl implements _LifeGoal {
  const _$LifeGoalImpl(
      {required this.id, required this.uid, required this.goal});

  factory _$LifeGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$LifeGoalImplFromJson(json);

  @override
  final int id;
  @override
  final int uid;
  @override
  final String goal;

  @override
  String toString() {
    return 'LifeGoal(id: $id, uid: $uid, goal: $goal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LifeGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, goal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LifeGoalImplCopyWith<_$LifeGoalImpl> get copyWith =>
      __$$LifeGoalImplCopyWithImpl<_$LifeGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LifeGoalImplToJson(
      this,
    );
  }
}

abstract class _LifeGoal implements LifeGoal {
  const factory _LifeGoal(
      {required final int id,
      required final int uid,
      required final String goal}) = _$LifeGoalImpl;

  factory _LifeGoal.fromJson(Map<String, dynamic> json) =
      _$LifeGoalImpl.fromJson;

  @override
  int get id;
  @override
  int get uid;
  @override
  String get goal;
  @override
  @JsonKey(ignore: true)
  _$$LifeGoalImplCopyWith<_$LifeGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
