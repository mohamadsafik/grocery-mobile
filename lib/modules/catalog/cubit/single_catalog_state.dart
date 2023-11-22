part of 'single_catalog_cubit.dart';

@freezed
class SingleCatalogState with _$SingleCatalogState {
  const factory SingleCatalogState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    Catalog? product,
    String? err,
  }) = _SingleCatalogState;
}
