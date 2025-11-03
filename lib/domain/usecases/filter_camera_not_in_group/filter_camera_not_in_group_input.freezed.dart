// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_camera_not_in_group_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$FilterCameraNotInGroupInput {
  List<int>? get groupId => throw _privateConstructorUsedError;

  /// Create a copy of FilterCameraNotInGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterCameraNotInGroupInputCopyWith<FilterCameraNotInGroupInput>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterCameraNotInGroupInputCopyWith<$Res> {
  factory $FilterCameraNotInGroupInputCopyWith(
    FilterCameraNotInGroupInput value,
    $Res Function(FilterCameraNotInGroupInput) then,
  ) =
      _$FilterCameraNotInGroupInputCopyWithImpl<
        $Res,
        FilterCameraNotInGroupInput
      >;
  @useResult
  $Res call({List<int>? groupId});
}

/// @nodoc
class _$FilterCameraNotInGroupInputCopyWithImpl<
  $Res,
  $Val extends FilterCameraNotInGroupInput
>
    implements $FilterCameraNotInGroupInputCopyWith<$Res> {
  _$FilterCameraNotInGroupInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterCameraNotInGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? groupId = freezed}) {
    return _then(
      _value.copyWith(
            groupId: freezed == groupId
                ? _value.groupId
                : groupId // ignore: cast_nullable_to_non_nullable
                      as List<int>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FilterCameraNotInGroupInputImplCopyWith<$Res>
    implements $FilterCameraNotInGroupInputCopyWith<$Res> {
  factory _$$FilterCameraNotInGroupInputImplCopyWith(
    _$FilterCameraNotInGroupInputImpl value,
    $Res Function(_$FilterCameraNotInGroupInputImpl) then,
  ) = __$$FilterCameraNotInGroupInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? groupId});
}

/// @nodoc
class __$$FilterCameraNotInGroupInputImplCopyWithImpl<$Res>
    extends
        _$FilterCameraNotInGroupInputCopyWithImpl<
          $Res,
          _$FilterCameraNotInGroupInputImpl
        >
    implements _$$FilterCameraNotInGroupInputImplCopyWith<$Res> {
  __$$FilterCameraNotInGroupInputImplCopyWithImpl(
    _$FilterCameraNotInGroupInputImpl _value,
    $Res Function(_$FilterCameraNotInGroupInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilterCameraNotInGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? groupId = freezed}) {
    return _then(
      _$FilterCameraNotInGroupInputImpl(
        groupId: freezed == groupId
            ? _value._groupId
            : groupId // ignore: cast_nullable_to_non_nullable
                  as List<int>?,
      ),
    );
  }
}

/// @nodoc

class _$FilterCameraNotInGroupInputImpl
    implements _FilterCameraNotInGroupInput {
  const _$FilterCameraNotInGroupInputImpl({final List<int>? groupId})
    : _groupId = groupId;

  final List<int>? _groupId;
  @override
  List<int>? get groupId {
    final value = _groupId;
    if (value == null) return null;
    if (_groupId is EqualUnmodifiableListView) return _groupId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FilterCameraNotInGroupInput(groupId: $groupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterCameraNotInGroupInputImpl &&
            const DeepCollectionEquality().equals(other._groupId, _groupId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_groupId));

  /// Create a copy of FilterCameraNotInGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterCameraNotInGroupInputImplCopyWith<_$FilterCameraNotInGroupInputImpl>
  get copyWith =>
      __$$FilterCameraNotInGroupInputImplCopyWithImpl<
        _$FilterCameraNotInGroupInputImpl
      >(this, _$identity);
}

abstract class _FilterCameraNotInGroupInput
    implements FilterCameraNotInGroupInput {
  const factory _FilterCameraNotInGroupInput({final List<int>? groupId}) =
      _$FilterCameraNotInGroupInputImpl;

  @override
  List<int>? get groupId;

  /// Create a copy of FilterCameraNotInGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterCameraNotInGroupInputImplCopyWith<_$FilterCameraNotInGroupInputImpl>
  get copyWith => throw _privateConstructorUsedError;
}
