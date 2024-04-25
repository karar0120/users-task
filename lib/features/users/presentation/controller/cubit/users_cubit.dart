import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:users_tasks/features/users/data/models/get_users_query_params.dart';
import 'package:users_tasks/features/users/domain/entity/users.dart';
import 'package:users_tasks/features/users/domain/use_case/users.dart';

part 'users_state.dart';
part 'users_cubit.freezed.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this._getUsersUseCase) : super(const UsersState.initial());

  final GetUsersUseCase _getUsersUseCase;

  List<UsersData> animalsDate = [];

  int limit = 15;
  int pageNo = 1;
  bool hasMore = true;
  bool isLoaded = false;
  bool isScroll = true;

  void incrementsNumberPage() {
    pageNo++;
    isLoaded = false;
    emit(const UsersState.incrementsNumberPage());
  }

  Future<void> refreshData() async {
    animalsDate.clear();
    isScroll = false;
    isLoaded = false;
    hasMore = true;
    pageNo = 1;
    emitGetUsersState();
  }

  void emitGetUsersState() async {
    emit(const UsersState.loading());
    if (isLoaded) return;
    isLoaded = true;
    isScroll = false;
    final response = await _getUsersUseCase
        .execute(GetUsersQueryParams(page: pageNo, perPage: limit));
    response.when(success: (usersResponse) {
      animalsDate.addAll(usersResponse.users);
      isLoaded = false;
      incrementsNumberPage();
      if (usersResponse.users.length < limit) {
        hasMore = false;
      }
      isScroll = true;
      emit(UsersState.success(usersResponse.users));
    }, failure: (error) {
      emit(UsersState.error(error: error.apiErrorModel.title ?? " "));
    });
  }
}
