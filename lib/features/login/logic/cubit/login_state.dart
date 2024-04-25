part of 'login_cubit.dart';

@freezed
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;

  const factory LoginState.loading() = Loading;

  const factory LoginState.success(T data) = Success<T>;

  const factory LoginState.error({required String error}) = Error;

  const factory LoginState.loginWithGoogleLoading() = LoginWithGoogleLoading;

  const factory LoginState.loginWithGoogleSuccess() = LoginWithGoogleSuccess;

  const factory LoginState.loginWithGoogleError({required String error}) =
      LoginWithGoogleError;
}
