import 'package:pets_finder/core/helper/constances.dart';
import 'package:pets_finder/core/helper/extensions.dart';
import 'package:pets_finder/features/animals/data/models/animals_response.dart';
import 'package:pets_finder/features/animals/domain/entity/animals.dart';

extension AnimalsResponseMapper on AnimalsResponse? {
  Animals toDomain() {
    return Animals(
        animals: (this
                    ?.animals
                    ?.map((animalsResponse) => animalsResponse.toDomain()) ??
                const Iterable.empty())
            .cast<AnimalsData>()
            .toList());
  }
}

extension AnimalsDataResponseMapper on AnimalsDataResponse? {
  AnimalsData toDomain() {
    return AnimalsData(
      id: this?.id.orZero() ?? Constances.zero,
      gender: this?.gender.orEmpty() ?? Constances.empty,
      name: this?.name.orEmpty() ?? Constances.empty,
      type: this?.type.orEmpty() ?? Constances.empty,
      smallPhoto: this?.photos?.isNotEmpty == true
          ? this!.photos![0].small.orEmpty()
          : Constances.empty,
    );
  }
}
