// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_catalog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SingleCatalogState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  Catalog? get product => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SingleCatalogStateCopyWith<SingleCatalogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleCatalogStateCopyWith<$Res> {
  factory $SingleCatalogStateCopyWith(
          SingleCatalogState value, $Res Function(SingleCatalogState) then) =
      _$SingleCatalogStateCopyWithImpl<$Res, SingleCatalogState>;
  @useResult
  $Res call({DataStateStatus status, Catalog? product, String? err});
}

/// @nodoc
class _$SingleCatalogStateCopyWithImpl<$Res, $Val extends SingleCatalogState>
    implements $SingleCatalogStateCopyWith<$Res> {
  _$SingleCatalogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? product = freezed,
    Object? err = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Catalog?,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SingleCatalogStateCopyWith<$Res>
    implements $SingleCatalogStateCopyWith<$Res> {
  factory _$$_SingleCatalogStateCopyWith(_$_SingleCatalogState value,
          $Res Function(_$_SingleCatalogState) then) =
      __$$_SingleCatalogStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataStateStatus status, Catalog? product, String? err});
}

/// @nodoc
class __$$_SingleCatalogStateCopyWithImpl<$Res>
    extends _$SingleCatalogStateCopyWithImpl<$Res, _$_SingleCatalogState>
    implements _$$_SingleCatalogStateCopyWith<$Res> {
  __$$_SingleCatalogStateCopyWithImpl(
      _$_SingleCatalogState _value, $Res Function(_$_SingleCatalogState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? product = freezed,
    Object? err = freezed,
  }) {
    return _then(_$_SingleCatalogState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Catalog?,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SingleCatalogState implements _SingleCatalogState {
  const _$_SingleCatalogState(
      {this.status = DataStateStatus.initial, this.product, this.err});

  @override
  @JsonKey()
  final DataStateStatus status;
  @override
  final Catalog? product;
  @override
  final String? err;

  @override
  String toString() {
    return 'SingleCatalogState(status: $status, product: $product, err: $err)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleCatalogState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.err, err) || other.err == err));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, product, err);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleCatalogStateCopyWith<_$_SingleCatalogState> get copyWith =>
      __$$_SingleCatalogStateCopyWithImpl<_$_SingleCatalogState>(
          this, _$identity);
}

abstract class _SingleCatalogState implements SingleCatalogState {
  const factory _SingleCatalogState(
      {final DataStateStatus status,
      final Catalog? product,
      final String? err}) = _$_SingleCatalogState;

  @override
  DataStateStatus get status;
  @override
  Catalog? get product;
  @override
  String? get err;
  @override
  @JsonKey(ignore: true)
  _$$_SingleCatalogStateCopyWith<_$_SingleCatalogState> get copyWith =>
      throw _privateConstructorUsedError;
}
