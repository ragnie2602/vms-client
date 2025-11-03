// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_user_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchUserOutput {
  List<UserEntity>? get listUserResult => throw _privateConstructorUsedError;

  /// Create a copy of SearchUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchUserOutputCopyWith<SearchUserOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserOutputCopyWith<$Res> {
  factory $SearchUserOutputCopyWith(
    SearchUserOutput value,
    $Res Function(SearchUserOutput) then,
  ) = _$SearchUserOutputCopyWithImpl<$Res, SearchUserOutput>;
  @useResult
  $Res call({List<UserEntity>? listUserResult});
}

/// @nodoc
class _$SearchUserOutputCopyWithImpl<$Res, $Val extends SearchUserOutput>
    implements $SearchUserOutputCopyWith<$Res> {
  _$SearchUserOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listUserResult = freezed}) {
    return _then(
      _value.copyWith(
            listUserResult: freezed == listUserResult
                ? _value.listUserResult
                : listUserResult // ignore: cast_nullable_to_non_nullable
                      as List<UserEntity>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchUserOutputImplCopyWith<$Res>
    implements $SearchUserOutputCopyWith<$Res> {
  factory _$$SearchUserOutputImplCopyWith(
    _$SearchUserOutputImpl value,
    $Res Function(_$SearchUserOutputImpl) then,
  ) = __$$SearchUserOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<UserEntity>? listUserResult});
}

/// @nodoc
class __$$SearchUserOutputImplCopyWithImpl<$Res>
    extends _$SearchUserOutputCopyWithImpl<$Res, _$SearchUserOutputImpl>
    implements _$$SearchUserOutputImplCopyWith<$Res> {
  __$$SearchUserOutputImplCopyWithImpl(
    _$SearchUserOutputImpl _value,
    $Res Function(_$SearchUserOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listUserResult = freezed}) {
    return _then(
      _$SearchUserOutputImpl(
        listUserResult: freezed == listUserResult
            ? _value._listUserResult
            : listUserResult // ignore: cast_nullable_to_non_nullable
                  as List<UserEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$SearchUserOutputImpl implements _SearchUserOutput {
  const _$SearchUserOutputImpl({final List<UserEntity>? listUserResult})
    : _listUserResult = listUserResult;

  final List<UserEntity>? _listUserResult;
  @override
  List<UserEntity>? get listUserResult {
    final value = _listUserResult;
    if (value == null) return null;
    if (_listUserResult is EqualUnmodifiableListView) return _listUserResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchUserOutput(listUserResult: $listUserResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserOutputImpl &&
            const DeepCollectionEquality().equals(
              other._listUserResult,
              _listUserResult,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_listUserResult),
  );

  /// Create a copy of SearchUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserOutputImplCopyWith<_$SearchUserOutputImpl> get copyWith =>
      __$$SearchUserOutputImplCopyWithImpl<_$SearchUserOutputImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchUserOutput implements SearchUserOutput {
  const factory _SearchUserOutput({final List<UserEntity>? listUserResult}) =
      _$SearchUserOutputImpl;

  @override
  List<UserEntity>? get listUserResult;

  /// Create a copy of SearchUserOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchUserOutputImplCopyWith<_$SearchUserOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
