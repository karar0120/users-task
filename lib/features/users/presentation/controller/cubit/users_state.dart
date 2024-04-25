part of 'users_cubit.dart';

@freezed
class UsersState<T> with _$UsersState<T> {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = Loading;

  const factory UsersState.incrementsNumberPage() = incrementsNumberPage;

  const factory UsersState.success(T data) = Success<T>;

  const factory UsersState.error({required String error}) = Error;
}
