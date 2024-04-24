import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_finder/features/animals/domain/use_case/animal_details.dart';

part 'animal_details_state.dart';
part 'animal_details_cubit.freezed.dart';

class AnimalDetailsCubit extends Cubit<AnimalDetailsState> {
  final GetAnimalsDetailsUseCase _animalsUseCase;
  AnimalDetailsCubit(this._animalsUseCase)
      : super(const AnimalDetailsState.initial());
  Future<void> getAnimalDetails(int id) async {
    emit(const AnimalDetailsState.loading());
    final response = await _animalsUseCase.execute(id);
    response.when(success: (animalsResponse) {
      emit(AnimalDetailsState.success(animalsResponse.animalsDetails));
    }, failure: (error) {
      emit(AnimalDetailsState.error(error: error.apiErrorModel.title ?? " "));
    });
  }
}
