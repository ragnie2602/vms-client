// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_group_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchGroupInput {
  String? get nameGroup => throw _privateConstructorUsedError;
  List<DeviceGroup>? get listGroupOrigin => throw _privateConstructorUsedError;

  /// Create a copy of SearchGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchGroupInputCopyWith<SearchGroupInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchGroupInputCopyWith<$Res> {
  factory $SearchGroupInputCopyWith(
    SearchGroupInput value,
    $Res Function(SearchGroupInput) then,
  ) = _$SearchGroupInputCopyWithImpl<$Res, SearchGroupInput>;
  @useResult
  $Res call({String? nameGroup, List<DeviceGroup>? listGroupOrigin});
}

/// @nodoc
class _$SearchGroupInputCopyWithImpl<$Res, $Val extends SearchGroupInput>
    implements $SearchGroupInputCopyWith<$Res> {
  _$SearchGroupInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nameGroup = freezed, Object? listGroupOrigin = freezed}) {
    return _then(
      _value.copyWith(
            nameGroup: freezed == nameGroup
                ? _value.nameGroup
                : nameGroup // ignore: cast_nullable_to_non_nullable
                      as String?,
            listGroupOrigin: freezed == listGroupOrigin
                ? _value.listGroupOrigin
                : listGroupOrigin // ignore: cast_nullable_to_non_nullable
                      as List<DeviceGroup>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchGroupInputImplCopyWith<$Res>
    implements $SearchGroupInputCopyWith<$Res> {
  factory _$$SearchGroupInputImplCopyWith(
    _$SearchGroupInputImpl value,
    $Res Function(_$SearchGroupInputImpl) then,
  ) = __$$SearchGroupInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nameGroup, List<DeviceGroup>? listGroupOrigin});
}

/// @nodoc
class __$$SearchGroupInputImplCopyWithImpl<$Res>
    extends _$SearchGroupInputCopyWithImpl<$Res, _$SearchGroupInputImpl>
    implements _$$SearchGroupInputImplCopyWith<$Res> {
  __$$SearchGroupInputImplCopyWithImpl(
    _$SearchGroupInputImpl _value,
    $Res Function(_$SearchGroupInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nameGroup = freezed, Object? listGroupOrigin = freezed}) {
    return _then(
      _$SearchGroupInputImpl(
        nameGroup: freezed == nameGroup
            ? _value.nameGroup
            : nameGroup // ignore: cast_nullable_to_non_nullable
                  as String?,
        listGroupOrigin: freezed == listGroupOrigin
            ? _value._listGroupOrigin
            : listGroupOrigin // ignore: cast_nullable_to_non_nullable
                  as List<DeviceGroup>?,
      ),
    );
  }
}

/// @nodoc

class _$SearchGroupInputImpl implements _SearchGroupInput {
  const _$SearchGroupInputImpl({
    this.nameGroup,
    final List<DeviceGroup>? listGroupOrigin,
  }) : _listGroupOrigin = listGroupOrigin;

  @override
  final String? nameGroup;
  final List<DeviceGroup>? _listGroupOrigin;
  @override
  List<DeviceGroup>? get listGroupOrigin {
    final value = _listGroupOrigin;
    if (value == null) return null;
    if (_listGroupOrigin is EqualUnmodifiableListView) return _listGroupOrigin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchGroupInput(nameGroup: $nameGroup, listGroupOrigin: $listGroupOrigin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchGroupInputImpl &&
            (identical(other.nameGroup, nameGroup) ||
                other.nameGroup == nameGroup) &&
            const DeepCollectionEquality().equals(
              other._listGroupOrigin,
              _listGroupOrigin,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    nameGroup,
    const DeepCollectionEquality().hash(_listGroupOrigin),
  );

  /// Create a copy of SearchGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchGroupInputImplCopyWith<_$SearchGroupInputImpl> get copyWith =>
      __$$SearchGroupInputImplCopyWithImpl<_$SearchGroupInputImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchGroupInput implements SearchGroupInput {
  const factory _SearchGroupInput({
    final String? nameGroup,
    final List<DeviceGroup>? listGroupOrigin,
  }) = _$SearchGroupInputImpl;

  @override
  String? get nameGroup;
  @override
  List<DeviceGroup>? get listGroupOrigin;

  /// Create a copy of SearchGroupInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchGroupInputImplCopyWith<_$SearchGroupInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
