// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_group_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchGroupOutput {
  List<DeviceGroup>? get listGroupResult => throw _privateConstructorUsedError;

  /// Create a copy of SearchGroupOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchGroupOutputCopyWith<SearchGroupOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchGroupOutputCopyWith<$Res> {
  factory $SearchGroupOutputCopyWith(
    SearchGroupOutput value,
    $Res Function(SearchGroupOutput) then,
  ) = _$SearchGroupOutputCopyWithImpl<$Res, SearchGroupOutput>;
  @useResult
  $Res call({List<DeviceGroup>? listGroupResult});
}

/// @nodoc
class _$SearchGroupOutputCopyWithImpl<$Res, $Val extends SearchGroupOutput>
    implements $SearchGroupOutputCopyWith<$Res> {
  _$SearchGroupOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchGroupOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listGroupResult = freezed}) {
    return _then(
      _value.copyWith(
            listGroupResult: freezed == listGroupResult
                ? _value.listGroupResult
                : listGroupResult // ignore: cast_nullable_to_non_nullable
                      as List<DeviceGroup>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchGroupOutputImplCopyWith<$Res>
    implements $SearchGroupOutputCopyWith<$Res> {
  factory _$$SearchGroupOutputImplCopyWith(
    _$SearchGroupOutputImpl value,
    $Res Function(_$SearchGroupOutputImpl) then,
  ) = __$$SearchGroupOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<DeviceGroup>? listGroupResult});
}

/// @nodoc
class __$$SearchGroupOutputImplCopyWithImpl<$Res>
    extends _$SearchGroupOutputCopyWithImpl<$Res, _$SearchGroupOutputImpl>
    implements _$$SearchGroupOutputImplCopyWith<$Res> {
  __$$SearchGroupOutputImplCopyWithImpl(
    _$SearchGroupOutputImpl _value,
    $Res Function(_$SearchGroupOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchGroupOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listGroupResult = freezed}) {
    return _then(
      _$SearchGroupOutputImpl(
        listGroupResult: freezed == listGroupResult
            ? _value._listGroupResult
            : listGroupResult // ignore: cast_nullable_to_non_nullable
                  as List<DeviceGroup>?,
      ),
    );
  }
}

/// @nodoc

class _$SearchGroupOutputImpl implements _SearchGroupOutput {
  const _$SearchGroupOutputImpl({final List<DeviceGroup>? listGroupResult})
    : _listGroupResult = listGroupResult;

  final List<DeviceGroup>? _listGroupResult;
  @override
  List<DeviceGroup>? get listGroupResult {
    final value = _listGroupResult;
    if (value == null) return null;
    if (_listGroupResult is EqualUnmodifiableListView) return _listGroupResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchGroupOutput(listGroupResult: $listGroupResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchGroupOutputImpl &&
            const DeepCollectionEquality().equals(
              other._listGroupResult,
              _listGroupResult,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_listGroupResult),
  );

  /// Create a copy of SearchGroupOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchGroupOutputImplCopyWith<_$SearchGroupOutputImpl> get copyWith =>
      __$$SearchGroupOutputImplCopyWithImpl<_$SearchGroupOutputImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchGroupOutput implements SearchGroupOutput {
  const factory _SearchGroupOutput({final List<DeviceGroup>? listGroupResult}) =
      _$SearchGroupOutputImpl;

  @override
  List<DeviceGroup>? get listGroupResult;

  /// Create a copy of SearchGroupOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchGroupOutputImplCopyWith<_$SearchGroupOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
