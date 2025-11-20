// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_tag_camera_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FilterTagCameraOutput {
  List<CameraEntity>? get listCamera => throw _privateConstructorUsedError;

  /// Create a copy of FilterTagCameraOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterTagCameraOutputCopyWith<FilterTagCameraOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterTagCameraOutputCopyWith<$Res> {
  factory $FilterTagCameraOutputCopyWith(
    FilterTagCameraOutput value,
    $Res Function(FilterTagCameraOutput) then,
  ) = _$FilterTagCameraOutputCopyWithImpl<$Res, FilterTagCameraOutput>;
  @useResult
  $Res call({List<CameraEntity>? listCamera});
}

/// @nodoc
class _$FilterTagCameraOutputCopyWithImpl<
  $Res,
  $Val extends FilterTagCameraOutput
>
    implements $FilterTagCameraOutputCopyWith<$Res> {
  _$FilterTagCameraOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterTagCameraOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listCamera = freezed}) {
    return _then(
      _value.copyWith(
            listCamera: freezed == listCamera
                ? _value.listCamera
                : listCamera // ignore: cast_nullable_to_non_nullable
                      as List<CameraEntity>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterTagCameraOutputImplCopyWith<$Res>
    implements $FilterTagCameraOutputCopyWith<$Res> {
  factory _$$FilterTagCameraOutputImplCopyWith(
    _$FilterTagCameraOutputImpl value,
    $Res Function(_$FilterTagCameraOutputImpl) then,
  ) = __$$FilterTagCameraOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CameraEntity>? listCamera});
}

/// @nodoc
class __$$FilterTagCameraOutputImplCopyWithImpl<$Res>
    extends
        _$FilterTagCameraOutputCopyWithImpl<$Res, _$FilterTagCameraOutputImpl>
    implements _$$FilterTagCameraOutputImplCopyWith<$Res> {
  __$$FilterTagCameraOutputImplCopyWithImpl(
    _$FilterTagCameraOutputImpl _value,
    $Res Function(_$FilterTagCameraOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterTagCameraOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listCamera = freezed}) {
    return _then(
      _$FilterTagCameraOutputImpl(
        listCamera: freezed == listCamera
            ? _value._listCamera
            : listCamera // ignore: cast_nullable_to_non_nullable
                  as List<CameraEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$FilterTagCameraOutputImpl implements _FilterTagCameraOutput {
  const _$FilterTagCameraOutputImpl({final List<CameraEntity>? listCamera})
    : _listCamera = listCamera;

  final List<CameraEntity>? _listCamera;
  @override
  List<CameraEntity>? get listCamera {
    final value = _listCamera;
    if (value == null) return null;
    if (_listCamera is EqualUnmodifiableListView) return _listCamera;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FilterTagCameraOutput(listCamera: $listCamera)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterTagCameraOutputImpl &&
            const DeepCollectionEquality().equals(
              other._listCamera,
              _listCamera,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_listCamera),
  );

  /// Create a copy of FilterTagCameraOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterTagCameraOutputImplCopyWith<_$FilterTagCameraOutputImpl>
  get copyWith =>
      __$$FilterTagCameraOutputImplCopyWithImpl<_$FilterTagCameraOutputImpl>(
        this,
        _$identity,
      );
}

abstract class _FilterTagCameraOutput implements FilterTagCameraOutput {
  const factory _FilterTagCameraOutput({final List<CameraEntity>? listCamera}) =
      _$FilterTagCameraOutputImpl;

  @override
  List<CameraEntity>? get listCamera;

  /// Create a copy of FilterTagCameraOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterTagCameraOutputImplCopyWith<_$FilterTagCameraOutputImpl>
  get copyWith => throw _privateConstructorUsedError;
}
