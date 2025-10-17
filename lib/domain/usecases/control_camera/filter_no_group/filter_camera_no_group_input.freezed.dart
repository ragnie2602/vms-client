// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_camera_no_group_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FilterCameraNoGroupInput {
  List<CameraEntity>? get listCameraOrigin =>
      throw _privateConstructorUsedError;

  /// Create a copy of FilterCameraNoGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterCameraNoGroupInputCopyWith<FilterCameraNoGroupInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCameraNoGroupInputCopyWith<$Res> {
  factory $FilterCameraNoGroupInputCopyWith(
    FilterCameraNoGroupInput value,
    $Res Function(FilterCameraNoGroupInput) then,
  ) = _$FilterCameraNoGroupInputCopyWithImpl<$Res, FilterCameraNoGroupInput>;
  @useResult
  $Res call({List<CameraEntity>? listCameraOrigin});
}

/// @nodoc
class _$FilterCameraNoGroupInputCopyWithImpl<
  $Res,
  $Val extends FilterCameraNoGroupInput
>
    implements $FilterCameraNoGroupInputCopyWith<$Res> {
  _$FilterCameraNoGroupInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterCameraNoGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listCameraOrigin = freezed}) {
    return _then(
      _value.copyWith(
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
abstract class _$$FilterCameraNoGroupInputImplCopyWith<$Res>
    implements $FilterCameraNoGroupInputCopyWith<$Res> {
  factory _$$FilterCameraNoGroupInputImplCopyWith(
    _$FilterCameraNoGroupInputImpl value,
    $Res Function(_$FilterCameraNoGroupInputImpl) then,
  ) = __$$FilterCameraNoGroupInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CameraEntity>? listCameraOrigin});
}

/// @nodoc
class __$$FilterCameraNoGroupInputImplCopyWithImpl<$Res>
    extends
        _$FilterCameraNoGroupInputCopyWithImpl<
          $Res,
          _$FilterCameraNoGroupInputImpl
        >
    implements _$$FilterCameraNoGroupInputImplCopyWith<$Res> {
  __$$FilterCameraNoGroupInputImplCopyWithImpl(
    _$FilterCameraNoGroupInputImpl _value,
    $Res Function(_$FilterCameraNoGroupInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterCameraNoGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listCameraOrigin = freezed}) {
    return _then(
      _$FilterCameraNoGroupInputImpl(
        listCameraOrigin: freezed == listCameraOrigin
            ? _value._listCameraOrigin
            : listCameraOrigin // ignore: cast_nullable_to_non_nullable
                  as List<CameraEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$FilterCameraNoGroupInputImpl implements _FilterCameraNoGroupInput {
  const _$FilterCameraNoGroupInputImpl({
    final List<CameraEntity>? listCameraOrigin,
  }) : _listCameraOrigin = listCameraOrigin;

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
    return 'FilterCameraNoGroupInput(listCameraOrigin: $listCameraOrigin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterCameraNoGroupInputImpl &&
            const DeepCollectionEquality().equals(
              other._listCameraOrigin,
              _listCameraOrigin,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_listCameraOrigin),
  );

  /// Create a copy of FilterCameraNoGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterCameraNoGroupInputImplCopyWith<_$FilterCameraNoGroupInputImpl>
  get copyWith =>
      __$$FilterCameraNoGroupInputImplCopyWithImpl<
        _$FilterCameraNoGroupInputImpl
      >(this, _$identity);
}

abstract class _FilterCameraNoGroupInput implements FilterCameraNoGroupInput {
  const factory _FilterCameraNoGroupInput({
    final List<CameraEntity>? listCameraOrigin,
  }) = _$FilterCameraNoGroupInputImpl;

  @override
  List<CameraEntity>? get listCameraOrigin;

  /// Create a copy of FilterCameraNoGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterCameraNoGroupInputImplCopyWith<_$FilterCameraNoGroupInputImpl>
  get copyWith => throw _privateConstructorUsedError;
}
