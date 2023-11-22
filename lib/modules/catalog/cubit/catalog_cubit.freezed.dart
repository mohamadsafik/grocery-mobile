// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CatalogState {
  DataStateStatus get status => throw _privateConstructorUsedError;
  List<Catalog> get data => throw _privateConstructorUsedError;
  String? get err => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CatalogStateCopyWith<CatalogState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogStateCopyWith<$Res> {
  factory $CatalogStateCopyWith(
          CatalogState value, $Res Function(CatalogState) then) =
      _$CatalogStateCopyWithImpl<$Res, CatalogState>;
  @useResult
  $Res call(
      {DataStateStatus status,
      List<Catalog> data,
      String? err,
      int page,
      bool canLoadMore});
}

/// @nodoc
class _$CatalogStateCopyWithImpl<$Res, $Val extends CatalogState>
    implements $CatalogStateCopyWith<$Res> {
  _$CatalogStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? err = freezed,
    Object? page = null,
    Object? canLoadMore = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Catalog>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CatalogStateCopyWith<$Res>
    implements $CatalogStateCopyWith<$Res> {
  factory _$$_CatalogStateCopyWith(
          _$_CatalogState value, $Res Function(_$_CatalogState) then) =
      __$$_CatalogStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataStateStatus status,
      List<Catalog> data,
      String? err,
      int page,
      bool canLoadMore});
}

/// @nodoc
class __$$_CatalogStateCopyWithImpl<$Res>
    extends _$CatalogStateCopyWithImpl<$Res, _$_CatalogState>
    implements _$$_CatalogStateCopyWith<$Res> {
  __$$_CatalogStateCopyWithImpl(
      _$_CatalogState _value, $Res Function(_$_CatalogState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? err = freezed,
    Object? page = null,
    Object? canLoadMore = null,
  }) {
    return _then(_$_CatalogState(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataStateStatus,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Catalog>,
      err: freezed == err
          ? _value.err
          : err // ignore: cast_nullable_to_non_nullable
              as String?,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CatalogState implements _CatalogState {
  const _$_CatalogState(
      {this.status = DataStateStatus.initial,
      final List<Catalog> data = const [],
      this.err,
      this.page = 1,
      this.canLoadMore = false})
      : _data = data;

  @override
  @JsonKey()
  final DataStateStatus status;
  final List<Catalog> _data;
  @override
  @JsonKey()
  List<Catalog> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String? err;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool canLoadMore;

  @override
  String toString() {
    return 'CatalogState(status: $status, data: $data, err: $err, page: $page, canLoadMore: $canLoadMore)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CatalogState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.err, err) || other.err == err) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_data), err, page, canLoadMore);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CatalogStateCopyWith<_$_CatalogState> get copyWith =>
      __$$_CatalogStateCopyWithImpl<_$_CatalogState>(this, _$identity);
}

abstract class _CatalogState implements CatalogState {
  const factory _CatalogState(
      {final DataStateStatus status,
      final List<Catalog> data,
      final String? err,
      final int page,
      final bool canLoadMore}) = _$_CatalogState;

  @override
  DataStateStatus get status;
  @override
  List<Catalog> get data;
  @override
  String? get err;
  @override
  int get page;
  @override
  bool get canLoadMore;
  @override
  @JsonKey(ignore: true)
  _$$_CatalogStateCopyWith<_$_CatalogState> get copyWith =>
      throw _privateConstructorUsedError;
}
