// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_emap_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchEmapInput {
  String? get keyword => throw _privateConstructorUsedError;
  List<EmapEntity> get listEmapOrigin => throw _privateConstructorUsedError;

  /// Create a copy of SearchEmapInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchEmapInputCopyWith<SearchEmapInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEmapInputCopyWith<$Res> {
  factory $SearchEmapInputCopyWith(
    SearchEmapInput value,
    $Res Function(SearchEmapInput) then,
  ) = _$SearchEmapInputCopyWithImpl<$Res, SearchEmapInput>;
  @useResult
  $Res call({String? keyword, List<EmapEntity> listEmapOrigin});
}

/// @nodoc
class _$SearchEmapInputCopyWithImpl<$Res, $Val extends SearchEmapInput>
    implements $SearchEmapInputCopyWith<$Res> {
  _$SearchEmapInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEmapInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? keyword = freezed, Object? listEmapOrigin = null}) {
    return _then(
      _value.copyWith(
            keyword: freezed == keyword
                ? _value.keyword
                : keyword // ignore: cast_nullable_to_non_nullable
                      as String?,
            listEmapOrigin: null == listEmapOrigin
                ? _value.listEmapOrigin
                : listEmapOrigin // ignore: cast_nullable_to_non_nullable
                      as List<EmapEntity>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchEmapInputImplCopyWith<$Res>
    implements $SearchEmapInputCopyWith<$Res> {
  factory _$$SearchEmapInputImplCopyWith(
    _$SearchEmapInputImpl value,
    $Res Function(_$SearchEmapInputImpl) then,
  ) = __$$SearchEmapInputImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? keyword, List<EmapEntity> listEmapOrigin});
}

/// @nodoc
class __$$SearchEmapInputImplCopyWithImpl<$Res>
    extends _$SearchEmapInputCopyWithImpl<$Res, _$SearchEmapInputImpl>
    implements _$$SearchEmapInputImplCopyWith<$Res> {
  __$$SearchEmapInputImplCopyWithImpl(
    _$SearchEmapInputImpl _value,
    $Res Function(_$SearchEmapInputImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEmapInput
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? keyword = freezed, Object? listEmapOrigin = null}) {
    return _then(
      _$SearchEmapInputImpl(
        keyword: freezed == keyword
            ? _value.keyword
            : keyword // ignore: cast_nullable_to_non_nullable
                  as String?,
        listEmapOrigin: null == listEmapOrigin
            ? _value._listEmapOrigin
            : listEmapOrigin // ignore: cast_nullable_to_non_nullable
                  as List<EmapEntity>,
      ),
    );
  }
}

/// @nodoc

class _$SearchEmapInputImpl implements _SearchEmapInput {
  const _$SearchEmapInputImpl({
    this.keyword,
    required final List<EmapEntity> listEmapOrigin,
  }) : _listEmapOrigin = listEmapOrigin;

  @override
  final String? keyword;
  final List<EmapEntity> _listEmapOrigin;
  @override
  List<EmapEntity> get listEmapOrigin {
    if (_listEmapOrigin is EqualUnmodifiableListView) return _listEmapOrigin;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listEmapOrigin);
  }

  @override
  String toString() {
    return 'SearchEmapInput(keyword: $keyword, listEmapOrigin: $listEmapOrigin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchEmapInputImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            const DeepCollectionEquality().equals(
              other._listEmapOrigin,
              _listEmapOrigin,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    keyword,
    const DeepCollectionEquality().hash(_listEmapOrigin),
  );

  /// Create a copy of SearchEmapInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchEmapInputImplCopyWith<_$SearchEmapInputImpl> get copyWith =>
      __$$SearchEmapInputImplCopyWithImpl<_$SearchEmapInputImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchEmapInput implements SearchEmapInput {
  const factory _SearchEmapInput({
    final String? keyword,
    required final List<EmapEntity> listEmapOrigin,
  }) = _$SearchEmapInputImpl;

  @override
  String? get keyword;
  @override
  List<EmapEntity> get listEmapOrigin;

  /// Create a copy of SearchEmapInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchEmapInputImplCopyWith<_$SearchEmapInputImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
