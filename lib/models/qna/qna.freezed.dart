// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qna.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QnA _$QnAFromJson(Map<String, dynamic> json) {
  return _QnA.fromJson(json);
}

/// @nodoc
mixin _$QnA {
  int get id => throw _privateConstructorUsedError;
  int get uid => throw _privateConstructorUsedError;
  String get topic => throw _privateConstructorUsedError;
  String get question => throw _privateConstructorUsedError;
  String get answer => throw _privateConstructorUsedError;
  String get openDate => throw _privateConstructorUsedError;
  String get writeDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QnACopyWith<QnA> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QnACopyWith<$Res> {
  factory $QnACopyWith(QnA value, $Res Function(QnA) then) =
      _$QnACopyWithImpl<$Res, QnA>;
  @useResult
  $Res call(
      {int id,
      int uid,
      String topic,
      String question,
      String answer,
      String openDate,
      String writeDate});
}

/// @nodoc
class _$QnACopyWithImpl<$Res, $Val extends QnA> implements $QnACopyWith<$Res> {
  _$QnACopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? topic = null,
    Object? question = null,
    Object? answer = null,
    Object? openDate = null,
    Object? writeDate = null,
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
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      openDate: null == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String,
      writeDate: null == writeDate
          ? _value.writeDate
          : writeDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QnAImplCopyWith<$Res> implements $QnACopyWith<$Res> {
  factory _$$QnAImplCopyWith(_$QnAImpl value, $Res Function(_$QnAImpl) then) =
      __$$QnAImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int uid,
      String topic,
      String question,
      String answer,
      String openDate,
      String writeDate});
}

/// @nodoc
class __$$QnAImplCopyWithImpl<$Res> extends _$QnACopyWithImpl<$Res, _$QnAImpl>
    implements _$$QnAImplCopyWith<$Res> {
  __$$QnAImplCopyWithImpl(_$QnAImpl _value, $Res Function(_$QnAImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? topic = null,
    Object? question = null,
    Object? answer = null,
    Object? openDate = null,
    Object? writeDate = null,
  }) {
    return _then(_$QnAImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as int,
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      question: null == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: null == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
      openDate: null == openDate
          ? _value.openDate
          : openDate // ignore: cast_nullable_to_non_nullable
              as String,
      writeDate: null == writeDate
          ? _value.writeDate
          : writeDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QnAImpl implements _QnA {
  const _$QnAImpl(
      {required this.id,
      required this.uid,
      required this.topic,
      required this.question,
      required this.answer,
      required this.openDate,
      required this.writeDate});

  factory _$QnAImpl.fromJson(Map<String, dynamic> json) =>
      _$$QnAImplFromJson(json);

  @override
  final int id;
  @override
  final int uid;
  @override
  final String topic;
  @override
  final String question;
  @override
  final String answer;
  @override
  final String openDate;
  @override
  final String writeDate;

  @override
  String toString() {
    return 'QnA(id: $id, uid: $uid, topic: $topic, question: $question, answer: $answer, openDate: $openDate, writeDate: $writeDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QnAImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.question, question) ||
                other.question == question) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.writeDate, writeDate) ||
                other.writeDate == writeDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, uid, topic, question, answer, openDate, writeDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QnAImplCopyWith<_$QnAImpl> get copyWith =>
      __$$QnAImplCopyWithImpl<_$QnAImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QnAImplToJson(
      this,
    );
  }
}

abstract class _QnA implements QnA {
  const factory _QnA(
      {required final int id,
      required final int uid,
      required final String topic,
      required final String question,
      required final String answer,
      required final String openDate,
      required final String writeDate}) = _$QnAImpl;

  factory _QnA.fromJson(Map<String, dynamic> json) = _$QnAImpl.fromJson;

  @override
  int get id;
  @override
  int get uid;
  @override
  String get topic;
  @override
  String get question;
  @override
  String get answer;
  @override
  String get openDate;
  @override
  String get writeDate;
  @override
  @JsonKey(ignore: true)
  _$$QnAImplCopyWith<_$QnAImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
