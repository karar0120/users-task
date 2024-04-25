import 'package:users_tasks/core/helper/constances.dart';
import 'package:users_tasks/features/users/data/models/users_response.dart';
import 'package:users_tasks/features/users/domain/entity/users.dart';
import 'package:users_tasks/core/helper/extensions.dart';

extension UsersResponseMapper on UsersResponse? {
  Users toDomain() {
    return Users(
        users: (this?.users?.map((usersResponse) => usersResponse.toDomain()) ??
                const Iterable.empty())
            .cast<UsersData>()
            .toList());
  }
}

extension AnimalsDataResponseMapper on UsersDataResponse? {
  UsersData toDomain() {
    return UsersData(
      id: this?.id.orZero() ?? Constances.zero,
      firstName: this?.firstName.orEmpty() ?? Constances.empty,
      lastName: this?.lastName.orEmpty() ?? Constances.empty,
      email: this?.email.orEmpty() ?? Constances.empty,
      avatar: this?.avatar.orEmpty() ?? Constances.empty,
    );
  }
}
