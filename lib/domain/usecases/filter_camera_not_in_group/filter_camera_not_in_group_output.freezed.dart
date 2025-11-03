// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_camera_not_in_group_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FilterCameraNotInGroupOutput {
  List<CameraEntity>? get listCamera => throw _privateConstructorUsedError;

  /// Create a copy of FilterCameraNotInGroupOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterCameraNotInGroupOutputCopyWith<FilterCameraNotInGroupOutput>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCameraNotInGroupOutputCopyWith<$Res> {
  factory $FilterCameraNotInGroupOutputCopyWith(
    FilterCameraNotInGroupOutput value,
    $Res Function(FilterCameraNotInGroupOutput) then,
  ) =
      _$FilterCameraNotInGroupOutputCopyWithImpl<
        $Res,
        FilterCameraNotInGroupOutput
      >;
  @useResult
  $Res call({List<CameraEntity>? listCamera});
}

/// @nodoc
class _$FilterCameraNotInGroupOutputCopyWithImpl<
  $Res,
  $Val extends FilterCameraNotInGroupOutput
>
    implements $FilterCameraNotInGroupOutputCopyWith<$Res> {
  _$FilterCameraNotInGroupOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterCameraNotInGroupOutput
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
abstract class _$$FilterCameraNotInGroupOutputImplCopyWith<$Res>
    implements $FilterCameraNotInGroupOutputCopyWith<$Res> {
  factory _$$FilterCameraNotInGroupOutputImplCopyWith(
    _$FilterCameraNotInGroupOutputImpl value,
    $Res Function(_$FilterCameraNotInGroupOutputImpl) then,
  ) = __$$FilterCameraNotInGroupOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CameraEntity>? listCamera});
}

/// @nodoc
class __$$FilterCameraNotInGroupOutputImplCopyWithImpl<$Res>
    extends
        _$FilterCameraNotInGroupOutputCopyWithImpl<
          $Res,
          _$FilterCameraNotInGroupOutputImpl
        >
    implements _$$FilterCameraNotInGroupOutputImplCopyWith<$Res> {
  __$$FilterCameraNotInGroupOutputImplCopyWithImpl(
    _$FilterCameraNotInGroupOutputImpl _value,
    $Res Function(_$FilterCameraNotInGroupOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterCameraNotInGroupOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listCamera = freezed}) {
    return _then(
      _$FilterCameraNotInGroupOutputImpl(
        listCamera: freezed == listCamera
            ? _value._listCamera
            : listCamera // ignore: cast_nullable_to_non_nullable
                  as List<CameraEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$FilterCameraNotInGroupOutputImpl
    implements _FilterCameraNotInGroupOutput {
  const _$FilterCameraNotInGroupOutputImpl({
    final List<CameraEntity>? listCamera,
  }) : _listCamera = listCamera;

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
    return 'FilterCameraNotInGroupOutput(listCamera: $listCamera)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterCameraNotInGroupOutputImpl &&
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

  /// Create a copy of FilterCameraNotInGroupOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterCameraNotInGroupOutputImplCopyWith<
    _$FilterCameraNotInGroupOutputImpl
  >
  get copyWith =>
      __$$FilterCameraNotInGroupOutputImplCopyWithImpl<
        _$FilterCameraNotInGroupOutputImpl
      >(this, _$identity);
}

abstract class _FilterCameraNotInGroupOutput
    implements FilterCameraNotInGroupOutput {
  const factory _FilterCameraNotInGroupOutput({
    final List<CameraEntity>? listCamera,
  }) = _$FilterCameraNotInGroupOutputImpl;

  @override
  List<CameraEntity>? get listCamera;

  /// Create a copy of FilterCameraNotInGroupOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterCameraNotInGroupOutputImplCopyWith<
    _$FilterCameraNotInGroupOutputImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
