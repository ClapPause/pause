// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MainGoal _$MainGoalFromJson(Map<String, dynamic> json) {
  return _MainGoal.fromJson(json);
}

/// @nodoc
mixin _$MainGoal {
  int get id => throw _privateConstructorUsedError;
  int get uid => throw _privateConstructorUsedError;
  int get selectColor => throw _privateConstructorUsedError;
  int get backgroundColor => throw _privateConstructorUsedError;
  bool get finish => throw _privateConstructorUsedError;
  String get deadline => throw _privateConstructorUsedError;
  String get goal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MainGoalCopyWith<MainGoal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MainGoalCopyWith<$Res> {
  factory $MainGoalCopyWith(MainGoal value, $Res Function(MainGoal) then) =
      _$MainGoalCopyWithImpl<$Res, MainGoal>;
  @useResult
  $Res call(
      {int id,
      int uid,
      int selectColor,
      int backgroundColor,
      bool finish,
      String deadline,
      String goal});
}

/// @nodoc
class _$MainGoalCopyWithImpl<$Res, $Val extends MainGoal>
    implements $MainGoalCopyWith<$Res> {
  _$MainGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? selectColor = null,
    Object? backgroundColor = null,
    Object? finish = null,
    Object? deadline = null,
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
      selectColor: null == selectColor
          ? _value.selectColor
          : selectColor // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as bool,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MainGoalImplCopyWith<$Res>
    implements $MainGoalCopyWith<$Res> {
  factory _$$MainGoalImplCopyWith(
          _$MainGoalImpl value, $Res Function(_$MainGoalImpl) then) =
      __$$MainGoalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int uid,
      int selectColor,
      int backgroundColor,
      bool finish,
      String deadline,
      String goal});
}

/// @nodoc
class __$$MainGoalImplCopyWithImpl<$Res>
    extends _$MainGoalCopyWithImpl<$Res, _$MainGoalImpl>
    implements _$$MainGoalImplCopyWith<$Res> {
  __$$MainGoalImplCopyWithImpl(
      _$MainGoalImpl _value, $Res Function(_$MainGoalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? selectColor = null,
    Object? backgroundColor = null,
    Object? finish = null,
    Object? deadline = null,
    Object? goal = null,
  }) {
    return _then(_$MainGoalImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      selectColor: null == selectColor
          ? _value.selectColor
          : selectColor // ignore: cast_nullable_to_non_nullable
              as int,
      backgroundColor: null == backgroundColor
          ? _value.backgroundColor
          : backgroundColor // ignore: cast_nullable_to_non_nullable
              as int,
      finish: null == finish
          ? _value.finish
          : finish // ignore: cast_nullable_to_non_nullable
              as bool,
      deadline: null == deadline
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as String,
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MainGoalImpl implements _MainGoal {
  const _$MainGoalImpl(
      {required this.id,
      required this.uid,
      required this.selectColor,
      required this.backgroundColor,
      required this.finish,
      required this.deadline,
      required this.goal});

  factory _$MainGoalImpl.fromJson(Map<String, dynamic> json) =>
      _$$MainGoalImplFromJson(json);

  @override
  final int id;
  @override
  final int uid;
  @override
  final int selectColor;
  @override
  final int backgroundColor;
  @override
  final bool finish;
  @override
  final String deadline;
  @override
  final String goal;

  @override
  String toString() {
    return 'MainGoal(id: $id, uid: $uid, selectColor: $selectColor, backgroundColor: $backgroundColor, finish: $finish, deadline: $deadline, goal: $goal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainGoalImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.selectColor, selectColor) ||
                other.selectColor == selectColor) &&
            (identical(other.backgroundColor, backgroundColor) ||
                other.backgroundColor == backgroundColor) &&
            (identical(other.finish, finish) || other.finish == finish) &&
            (identical(other.deadline, deadline) ||
                other.deadline == deadline) &&
            (identical(other.goal, goal) || other.goal == goal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, selectColor,
      backgroundColor, finish, deadline, goal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainGoalImplCopyWith<_$MainGoalImpl> get copyWith =>
      __$$MainGoalImplCopyWithImpl<_$MainGoalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MainGoalImplToJson(
      this,
    );
  }
}

abstract class _MainGoal implements MainGoal {
  const factory _MainGoal(
      {required final int id,
      required final int uid,
      required final int selectColor,
      required final int backgroundColor,
      required final bool finish,
      required final String deadline,
      required final String goal}) = _$MainGoalImpl;

  factory _MainGoal.fromJson(Map<String, dynamic> json) =
      _$MainGoalImpl.fromJson;

  @override
  int get id;
  @override
  int get uid;
  @override
  int get selectColor;
  @override
  int get backgroundColor;
  @override
  bool get finish;
  @override
  String get deadline;
  @override
  String get goal;
  @override
  @JsonKey(ignore: true)
  _$$MainGoalImplCopyWith<_$MainGoalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
