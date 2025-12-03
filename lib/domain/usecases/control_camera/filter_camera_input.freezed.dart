// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_camera_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FilterCameraInput {
  String? get nameCamera => throw _privateConstructorUsedError;
  bool? get isOnline => throw _privateConstructorUsedError;
  String? get tagName => throw _privateConstructorUsedError;
  List<CameraEntity>? get listCameraOrigin =>
      throw _privateConstructorUsedError;

  /// Create a copy of FilterCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterCameraInputCopyWith<FilterCameraInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCameraInputCopyWith<$Res> {
  factory $FilterCameraInputCopyWith(
    FilterCameraInput value,
    $Res Function(FilterCameraInput) then,
  ) = _$FilterCameraInputCopyWithImpl<$Res, FilterCameraInput>;
  @useResult
  $Res call({
    String? nameCamera,
    bool? isOnline,
    String? tagName,
    List<CameraEntity>? listCameraOrigin,
  });
}

/// @nodoc
class _$FilterCameraInputCopyWithImpl<$Res, $Val extends FilterCameraInput>
    implements $FilterCameraInputCopyWith<$Res> {
  _$FilterCameraInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameCamera = freezed,
    Object? isOnline = freezed,
    Object? tagName = freezed,
    Object? listCameraOrigin = freezed,
  }) {
    return _then(
      _value.copyWith(
            nameCamera: freezed == nameCamera
                ? _value.nameCamera
                : nameCamera // ignore: cast_nullable_to_non_nullable
                      as String?,
            isOnline: freezed == isOnline
                ? _value.isOnline
                : isOnline // ignore: cast_nullable_to_non_nullable
                      as bool?,
            tagName: freezed == tagName
                ? _value.tagName
                : tagName // ignore: cast_nullable_to_non_nullable
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
abstract class _$$FilterCameraInputImplCopyWith<$Res>
    implements $FilterCameraInputCopyWith<$Res> {
  factory _$$FilterCameraInputImplCopyWith(
    _$FilterCameraInputImpl value,
    $Res Function(_$FilterCameraInputImpl) then,
  ) = __$$FilterCameraInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? nameCamera,
    bool? isOnline,
    String? tagName,
    List<CameraEntity>? listCameraOrigin,
  });
}

/// @nodoc
class __$$FilterCameraInputImplCopyWithImpl<$Res>
    extends _$FilterCameraInputCopyWithImpl<$Res, _$FilterCameraInputImpl>
    implements _$$FilterCameraInputImplCopyWith<$Res> {
  __$$FilterCameraInputImplCopyWithImpl(
    _$FilterCameraInputImpl _value,
    $Res Function(_$FilterCameraInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameCamera = freezed,
    Object? isOnline = freezed,
    Object? tagName = freezed,
    Object? listCameraOrigin = freezed,
  }) {
    return _then(
      _$FilterCameraInputImpl(
        nameCamera: freezed == nameCamera
            ? _value.nameCamera
            : nameCamera // ignore: cast_nullable_to_non_nullable
                  as String?,
        isOnline: freezed == isOnline
            ? _value.isOnline
            : isOnline // ignore: cast_nullable_to_non_nullable
                  as bool?,
        tagName: freezed == tagName
            ? _value.tagName
            : tagName // ignore: cast_nullable_to_non_nullable
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

class _$FilterCameraInputImpl implements _FilterCameraInput {
  const _$FilterCameraInputImpl({
    this.nameCamera,
    this.isOnline,
    this.tagName,
    final List<CameraEntity>? listCameraOrigin,
  }) : _listCameraOrigin = listCameraOrigin;

  @override
  final String? nameCamera;
  @override
  final bool? isOnline;
  @override
  final String? tagName;
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
    return 'FilterCameraInput(nameCamera: $nameCamera, isOnline: $isOnline, tagName: $tagName, listCameraOrigin: $listCameraOrigin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterCameraInputImpl &&
            (identical(other.nameCamera, nameCamera) ||
                other.nameCamera == nameCamera) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.tagName, tagName) || other.tagName == tagName) &&
            const DeepCollectionEquality().equals(
              other._listCameraOrigin,
              _listCameraOrigin,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    nameCamera,
    isOnline,
    tagName,
    const DeepCollectionEquality().hash(_listCameraOrigin),
  );

  /// Create a copy of FilterCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterCameraInputImplCopyWith<_$FilterCameraInputImpl> get copyWith =>
      __$$FilterCameraInputImplCopyWithImpl<_$FilterCameraInputImpl>(
        this,
        _$identity,
      );
}

abstract class _FilterCameraInput implements FilterCameraInput {
  const factory _FilterCameraInput({
    final String? nameCamera,
    final bool? isOnline,
    final String? tagName,
    final List<CameraEntity>? listCameraOrigin,
  }) = _$FilterCameraInputImpl;

  @override
  String? get nameCamera;
  @override
  bool? get isOnline;
  @override
  String? get tagName;
  @override
  List<CameraEntity>? get listCameraOrigin;

  /// Create a copy of FilterCameraInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterCameraInputImplCopyWith<_$FilterCameraInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
