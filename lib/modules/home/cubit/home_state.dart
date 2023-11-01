part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default([]) List<Article> data,
    String? err,
    @Default(1) int page,
    @Default(false) bool canLoadMore,
    User? user,
  }) = _HomeState;
}
