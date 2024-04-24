import 'package:pets_finder/core/helper/constances.dart';
import 'package:pets_finder/core/helper/extensions.dart';
import 'package:pets_finder/features/animals/data/models/details_animal_response_.dart';
import 'package:pets_finder/features/animals/domain/entity/details_animal.dart';

extension AllAnimalsDetailsResponseMapper on AnimalsDetailsResponse? {
  AllAnimalsDetails toDomain() {
    return AllAnimalsDetails(
        animalsDetails: this?.animalsDataDetailsResponse?.toDomain());
  }
}

extension AnimalsDetailsResponseMapper on AnimalsDataDetailsResponse? {
  AnimalsDetails toDomain() {
    return AnimalsDetails(
      id: this?.id.orZero() ?? Constances.zero,
      name: this?.name.orEmpty() ?? Constances.empty,
      size: this?.size.orEmpty() ?? Constances.empty,
      url: this?.url.orEmpty() ?? Constances.empty,
      mediumphotos: this?.photos?.isNotEmpty == true
          ? this!.photos![0].medium.orEmpty()
          : Constances.empty,
      contact: this?.contact.toDomain(),
      colors: this?.colors.toDomain(),
    );
  }
}

extension ContectDetailsMapper on Contact? {
  ContactDetails toDomain() {
    return ContactDetails(
      address: this?.address.toDomain(),
    );
  }
}

extension AddressDetailsMapper on Address? {
  AddressDetails toDomain() {
    return AddressDetails(
      city: this?.city.orEmpty() ?? Constances.empty,
      state: this?.state.orEmpty() ?? Constances.empty,
      postcode: this?.postcode.orEmpty() ?? Constances.empty,
      country: this?.country.orEmpty() ?? Constances.empty,
    );
  }
}

extension ColorsDetailsMapper on Colors? {
  ColorsDetails toDomain() {
    return ColorsDetails(
      primary: this?.primary.orEmpty() ?? Constances.empty,
    );
  }
}
