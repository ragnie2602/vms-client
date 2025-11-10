// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_emap_output.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchEmapOutput {
  List<EmapEntity>? get listEmapResult => throw _privateConstructorUsedError;

  /// Create a copy of SearchEmapOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchEmapOutputCopyWith<SearchEmapOutput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEmapOutputCopyWith<$Res> {
  factory $SearchEmapOutputCopyWith(
    SearchEmapOutput value,
    $Res Function(SearchEmapOutput) then,
  ) = _$SearchEmapOutputCopyWithImpl<$Res, SearchEmapOutput>;
  @useResult
  $Res call({List<EmapEntity>? listEmapResult});
}

/// @nodoc
class _$SearchEmapOutputCopyWithImpl<$Res, $Val extends SearchEmapOutput>
    implements $SearchEmapOutputCopyWith<$Res> {
  _$SearchEmapOutputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEmapOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listEmapResult = freezed}) {
    return _then(
      _value.copyWith(
            listEmapResult: freezed == listEmapResult
                ? _value.listEmapResult
                : listEmapResult // ignore: cast_nullable_to_non_nullable
                      as List<EmapEntity>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchEmapOutputImplCopyWith<$Res>
    implements $SearchEmapOutputCopyWith<$Res> {
  factory _$$SearchEmapOutputImplCopyWith(
    _$SearchEmapOutputImpl value,
    $Res Function(_$SearchEmapOutputImpl) then,
  ) = __$$SearchEmapOutputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<EmapEntity>? listEmapResult});
}

/// @nodoc
class __$$SearchEmapOutputImplCopyWithImpl<$Res>
    extends _$SearchEmapOutputCopyWithImpl<$Res, _$SearchEmapOutputImpl>
    implements _$$SearchEmapOutputImplCopyWith<$Res> {
  __$$SearchEmapOutputImplCopyWithImpl(
    _$SearchEmapOutputImpl _value,
    $Res Function(_$SearchEmapOutputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEmapOutput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? listEmapResult = freezed}) {
    return _then(
      _$SearchEmapOutputImpl(
        listEmapResult: freezed == listEmapResult
            ? _value._listEmapResult
            : listEmapResult // ignore: cast_nullable_to_non_nullable
                  as List<EmapEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$SearchEmapOutputImpl implements _SearchEmapOutput {
  const _$SearchEmapOutputImpl({final List<EmapEntity>? listEmapResult})
    : _listEmapResult = listEmapResult;

  final List<EmapEntity>? _listEmapResult;
  @override
  List<EmapEntity>? get listEmapResult {
    final value = _listEmapResult;
    if (value == null) return null;
    if (_listEmapResult is EqualUnmodifiableListView) return _listEmapResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchEmapOutput(listEmapResult: $listEmapResult)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEmapOutputImpl &&
            const DeepCollectionEquality().equals(
              other._listEmapResult,
              _listEmapResult,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_listEmapResult),
  );

  /// Create a copy of SearchEmapOutput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEmapOutputImplCopyWith<_$SearchEmapOutputImpl> get copyWith =>
      __$$SearchEmapOutputImplCopyWithImpl<_$SearchEmapOutputImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchEmapOutput implements SearchEmapOutput {
  const factory _SearchEmapOutput({final List<EmapEntity>? listEmapResult}) =
      _$SearchEmapOutputImpl;

  @override
  List<EmapEntity>? get listEmapResult;

  /// Create a copy of SearchEmapOutput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchEmapOutputImplCopyWith<_$SearchEmapOutputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
