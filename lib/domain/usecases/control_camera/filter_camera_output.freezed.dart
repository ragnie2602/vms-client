// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_camera_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FilterCameraOutput {
  List<CameraEntity>? get listCamera => throw _privateConstructorUsedError;

  /// Create a copy of FilterCameraOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterCameraOutputCopyWith<FilterCameraOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCameraOutputCopyWith<$Res> {
  factory $FilterCameraOutputCopyWith(
    FilterCameraOutput value,
    $Res Function(FilterCameraOutput) then,
  ) = _$FilterCameraOutputCopyWithImpl<$Res, FilterCameraOutput>;
  @useResult
  $Res call({List<CameraEntity>? listCamera});
}

/// @nodoc
class _$FilterCameraOutputCopyWithImpl<$Res, $Val extends FilterCameraOutput>
    implements $FilterCameraOutputCopyWith<$Res> {
  _$FilterCameraOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterCameraOutput
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
abstract class _$$FilterCameraOutputImplCopyWith<$Res>
    implements $FilterCameraOutputCopyWith<$Res> {
  factory _$$FilterCameraOutputImplCopyWith(
    _$FilterCameraOutputImpl value,
    $Res Function(_$FilterCameraOutputImpl) then,
  ) = __$$FilterCameraOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CameraEntity>? listCamera});
}

/// @nodoc
class __$$FilterCameraOutputImplCopyWithImpl<$Res>
    extends _$FilterCameraOutputCopyWithImpl<$Res, _$FilterCameraOutputImpl>
    implements _$$FilterCameraOutputImplCopyWith<$Res> {
  __$$FilterCameraOutputImplCopyWithImpl(
    _$FilterCameraOutputImpl _value,
    $Res Function(_$FilterCameraOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterCameraOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listCamera = freezed}) {
    return _then(
      _$FilterCameraOutputImpl(
        listCamera: freezed == listCamera
            ? _value._listCamera
            : listCamera // ignore: cast_nullable_to_non_nullable
                  as List<CameraEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$FilterCameraOutputImpl implements _FilterCameraOutput {
  const _$FilterCameraOutputImpl({final List<CameraEntity>? listCamera})
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
    return 'FilterCameraOutput(listCamera: $listCamera)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterCameraOutputImpl &&
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

  /// Create a copy of FilterCameraOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterCameraOutputImplCopyWith<_$FilterCameraOutputImpl> get copyWith =>
      __$$FilterCameraOutputImplCopyWithImpl<_$FilterCameraOutputImpl>(
        this,
        _$identity,
      );
}

abstract class _FilterCameraOutput implements FilterCameraOutput {
  const factory _FilterCameraOutput({final List<CameraEntity>? listCamera}) =
      _$FilterCameraOutputImpl;

  @override
  List<CameraEntity>? get listCamera;

  /// Create a copy of FilterCameraOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterCameraOutputImplCopyWith<_$FilterCameraOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
