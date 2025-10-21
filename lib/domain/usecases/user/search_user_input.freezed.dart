// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_user_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchUserInput {
  String? get nameUser => throw _privateConstructorUsedError;
  List<UserEntity>? get listUserOrigin => throw _privateConstructorUsedError;

  /// Create a copy of SearchUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchUserInputCopyWith<SearchUserInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchUserInputCopyWith<$Res> {
  factory $SearchUserInputCopyWith(
    SearchUserInput value,
    $Res Function(SearchUserInput) then,
  ) = _$SearchUserInputCopyWithImpl<$Res, SearchUserInput>;
  @useResult
  $Res call({String? nameUser, List<UserEntity>? listUserOrigin});
}

/// @nodoc
class _$SearchUserInputCopyWithImpl<$Res, $Val extends SearchUserInput>
    implements $SearchUserInputCopyWith<$Res> {
  _$SearchUserInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nameUser = freezed, Object? listUserOrigin = freezed}) {
    return _then(
      _value.copyWith(
            nameUser: freezed == nameUser
                ? _value.nameUser
                : nameUser // ignore: cast_nullable_to_non_nullable
                      as String?,
            listUserOrigin: freezed == listUserOrigin
                ? _value.listUserOrigin
                : listUserOrigin // ignore: cast_nullable_to_non_nullable
                      as List<UserEntity>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchUserInputImplCopyWith<$Res>
    implements $SearchUserInputCopyWith<$Res> {
  factory _$$SearchUserInputImplCopyWith(
    _$SearchUserInputImpl value,
    $Res Function(_$SearchUserInputImpl) then,
  ) = __$$SearchUserInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? nameUser, List<UserEntity>? listUserOrigin});
}

/// @nodoc
class __$$SearchUserInputImplCopyWithImpl<$Res>
    extends _$SearchUserInputCopyWithImpl<$Res, _$SearchUserInputImpl>
    implements _$$SearchUserInputImplCopyWith<$Res> {
  __$$SearchUserInputImplCopyWithImpl(
    _$SearchUserInputImpl _value,
    $Res Function(_$SearchUserInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchUserInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nameUser = freezed, Object? listUserOrigin = freezed}) {
    return _then(
      _$SearchUserInputImpl(
        nameUser: freezed == nameUser
            ? _value.nameUser
            : nameUser // ignore: cast_nullable_to_non_nullable
                  as String?,
        listUserOrigin: freezed == listUserOrigin
            ? _value._listUserOrigin
            : listUserOrigin // ignore: cast_nullable_to_non_nullable
                  as List<UserEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$SearchUserInputImpl implements _SearchUserInput {
  const _$SearchUserInputImpl({
    this.nameUser,
    final List<UserEntity>? listUserOrigin,
  }) : _listUserOrigin = listUserOrigin;

  @override
  final String? nameUser;
  final List<UserEntity>? _listUserOrigin;
  @override
  List<UserEntity>? get listUserOrigin {
    final value = _listUserOrigin;
    if (value == null) return null;
    if (_listUserOrigin is EqualUnmodifiableListView) return _listUserOrigin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchUserInput(nameUser: $nameUser, listUserOrigin: $listUserOrigin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchUserInputImpl &&
            (identical(other.nameUser, nameUser) ||
                other.nameUser == nameUser) &&
            const DeepCollectionEquality().equals(
              other._listUserOrigin,
              _listUserOrigin,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    nameUser,
    const DeepCollectionEquality().hash(_listUserOrigin),
  );

  /// Create a copy of SearchUserInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchUserInputImplCopyWith<_$SearchUserInputImpl> get copyWith =>
      __$$SearchUserInputImplCopyWithImpl<_$SearchUserInputImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchUserInput implements SearchUserInput {
  const factory _SearchUserInput({
    final String? nameUser,
    final List<UserEntity>? listUserOrigin,
  }) = _$SearchUserInputImpl;

  @override
  String? get nameUser;
  @override
  List<UserEntity>? get listUserOrigin;

  /// Create a copy of SearchUserInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchUserInputImplCopyWith<_$SearchUserInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
