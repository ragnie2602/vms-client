// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_tag_camera_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FilterTagCameraInput {
  String? get tagName => throw _privateConstructorUsedError;
  String? get keyWord => throw _privateConstructorUsedError;
  List<CameraEntity>? get listCameraOrigin =>
      throw _privateConstructorUsedError;

  /// Create a copy of FilterTagCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterTagCameraInputCopyWith<FilterTagCameraInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterTagCameraInputCopyWith<$Res> {
  factory $FilterTagCameraInputCopyWith(
    FilterTagCameraInput value,
    $Res Function(FilterTagCameraInput) then,
  ) = _$FilterTagCameraInputCopyWithImpl<$Res, FilterTagCameraInput>;
  @useResult
  $Res call({
    String? tagName,
    String? keyWord,
    List<CameraEntity>? listCameraOrigin,
  });
}

/// @nodoc
class _$FilterTagCameraInputCopyWithImpl<
  $Res,
  $Val extends FilterTagCameraInput
>
    implements $FilterTagCameraInputCopyWith<$Res> {
  _$FilterTagCameraInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterTagCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagName = freezed,
    Object? keyWord = freezed,
    Object? listCameraOrigin = freezed,
  }) {
    return _then(
      _value.copyWith(
            tagName: freezed == tagName
                ? _value.tagName
                : tagName // ignore: cast_nullable_to_non_nullable
                      as String?,
            keyWord: freezed == keyWord
                ? _value.keyWord
                : keyWord // ignore: cast_nullable_to_non_nullable
                      as String?,
            listCameraOrigin: freezed == listCameraOrigin
                ? _value.listCameraOrigin
                : listCameraOrigin // ignore: cast_nullable_to_non_nullable
                      as List<CameraEntity>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterTagCameraInputImplCopyWith<$Res>
    implements $FilterTagCameraInputCopyWith<$Res> {
  factory _$$FilterTagCameraInputImplCopyWith(
    _$FilterTagCameraInputImpl value,
    $Res Function(_$FilterTagCameraInputImpl) then,
  ) = __$$FilterTagCameraInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? tagName,
    String? keyWord,
    List<CameraEntity>? listCameraOrigin,
  });
}

/// @nodoc
class __$$FilterTagCameraInputImplCopyWithImpl<$Res>
    extends _$FilterTagCameraInputCopyWithImpl<$Res, _$FilterTagCameraInputImpl>
    implements _$$FilterTagCameraInputImplCopyWith<$Res> {
  __$$FilterTagCameraInputImplCopyWithImpl(
    _$FilterTagCameraInputImpl _value,
    $Res Function(_$FilterTagCameraInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterTagCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tagName = freezed,
    Object? keyWord = freezed,
    Object? listCameraOrigin = freezed,
  }) {
    return _then(
      _$FilterTagCameraInputImpl(
        tagName: freezed == tagName
            ? _value.tagName
            : tagName // ignore: cast_nullable_to_non_nullable
                  as String?,
        keyWord: freezed == keyWord
            ? _value.keyWord
            : keyWord // ignore: cast_nullable_to_non_nullable
                  as String?,
        listCameraOrigin: freezed == listCameraOrigin
            ? _value._listCameraOrigin
            : listCameraOrigin // ignore: cast_nullable_to_non_nullable
                  as List<CameraEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$FilterTagCameraInputImpl implements _FilterTagCameraInput {
  const _$FilterTagCameraInputImpl({
    this.tagName,
    this.keyWord,
    final List<CameraEntity>? listCameraOrigin,
  }) : _listCameraOrigin = listCameraOrigin;

  @override
  final String? tagName;
  @override
  final String? keyWord;
  final List<CameraEntity>? _listCameraOrigin;
  @override
  List<CameraEntity>? get listCameraOrigin {
    final value = _listCameraOrigin;
    if (value == null) return null;
    if (_listCameraOrigin is EqualUnmodifiableListView)
      return _listCameraOrigin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FilterTagCameraInput(tagName: $tagName, keyWord: $keyWord, listCameraOrigin: $listCameraOrigin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterTagCameraInputImpl &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            (identical(other.keyWord, keyWord) || other.keyWord == keyWord) &&
            const DeepCollectionEquality().equals(
              other._listCameraOrigin,
              _listCameraOrigin,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tagName,
    keyWord,
    const DeepCollectionEquality().hash(_listCameraOrigin),
  );

  /// Create a copy of FilterTagCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterTagCameraInputImplCopyWith<_$FilterTagCameraInputImpl>
  get copyWith =>
      __$$FilterTagCameraInputImplCopyWithImpl<_$FilterTagCameraInputImpl>(
        this,
        _$identity,
      );
}

abstract class _FilterTagCameraInput implements FilterTagCameraInput {
  const factory _FilterTagCameraInput({
    final String? tagName,
    final String? keyWord,
    final List<CameraEntity>? listCameraOrigin,
  }) = _$FilterTagCameraInputImpl;

  @override
  String? get tagName;
  @override
  String? get keyWord;
  @override
  List<CameraEntity>? get listCameraOrigin;

  /// Create a copy of FilterTagCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterTagCameraInputImplCopyWith<_$FilterTagCameraInputImpl>
  get copyWith => throw _privateConstructorUsedError;
}
