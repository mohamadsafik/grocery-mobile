part of 'catalog_cubit.dart';

@freezed
class CatalogState with _$CatalogState {
  const factory CatalogState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<Catalog> data,
    String? err,
    @Default(1) int page,
    @Default(false) bool canLoadMore,
  }) = _CatalogState;
}
