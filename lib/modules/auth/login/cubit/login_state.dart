part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default(DataStateStatus.initial) DataStateStatus status,
    @Default("-") String message,
  }) = _LoginState;
}
