part of 'animal_details_cubit.dart';

@freezed
class AnimalDetailsState<T> with _$AnimalDetailsState<T> {
  const factory AnimalDetailsState.initial() = _Initial;
  const factory AnimalDetailsState.loading() = Loading;

  const factory AnimalDetailsState.success(T data) = Success<T>;

  const factory AnimalDetailsState.error({required String error}) = Error;
}
