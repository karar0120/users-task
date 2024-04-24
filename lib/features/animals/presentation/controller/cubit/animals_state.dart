part of 'animals_cubit.dart';

@freezed
class AnimalsState<T> with _$AnimalsState<T> {
  const factory AnimalsState.initial() = _Initial;
  const factory AnimalsState.loading() = Loading;

  const factory AnimalsState.incrementsNumberPage() = incrementsNumberPage;

  const factory AnimalsState.setSelectedFilterAnimals() =
      setSelectedFilterAnimals;

  const factory AnimalsState.success(T data) = Success<T>;

  const factory AnimalsState.error({required String error}) = Error;
}
