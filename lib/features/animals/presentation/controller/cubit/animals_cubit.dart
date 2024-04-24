import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pets_finder/features/animals/data/models/get_animals_query_params.dart';
import 'package:pets_finder/features/animals/domain/entity/animals.dart';
import 'package:pets_finder/features/animals/domain/entity/filter_animals.dart';
import 'package:pets_finder/features/animals/domain/use_case/animals.dart';

part 'animals_state.dart';
part 'animals_cubit.freezed.dart';

class AnimalsCubit extends Cubit<AnimalsState> {
  AnimalsCubit(this._animalsUseCase) : super(const AnimalsState.initial());

  final GetAnimalsUseCase _animalsUseCase;

  List<AnimalsData> animalsDate = [];

  int limit = 15;
  int pageNo = 1;
  bool hasMore = true;
  bool isLoaded = false;
  bool isScroll = true;

  void incrementsNumberPage() {
    pageNo++;
    isLoaded = false;
    emit(const AnimalsState.incrementsNumberPage());
  }

  Future<void> refreshData() async {
    animalsDate.clear();
    isScroll = false;
    isLoaded = false;
    hasMore = true;
    pageNo = 1;
    emitGetAnimalsState();
  }

  FilterAnimals? _selectedFilterItem;

  FilterAnimals? get selectedFilterItem => _selectedFilterItem;

  void setSelectedFilterAnimals(FilterAnimals filterAnimals) {
    _selectedFilterItem = filterAnimals;
    refreshData();
  }

  void emitGetAnimalsState() async {
    emit(const AnimalsState.loading());
    if (isLoaded) return;
    isLoaded = true;
    isScroll = false;
    final response = await _animalsUseCase.execute(GetAnimalsQueryParams(
        type: _selectedFilterItem?.value ?? "", page: pageNo, limit: limit));
    response.when(success: (animalsResponse) {
      animalsDate.addAll(animalsResponse.animals);
      isLoaded = false;
      incrementsNumberPage();
      if (animalsResponse.animals.length < limit) {
        hasMore = false;
      }
      isScroll = true;
      emit(AnimalsState.success(animalsResponse.animals));
    }, failure: (error) {
      emit(AnimalsState.error(error: error.apiErrorModel.title ?? " "));
    });
  }
}
