import 'package:flutter/material.dart';
import 'package:pets_finder/core/helper/spacing.dart';
import 'package:pets_finder/core/helper/strings_manger.dart';
import 'package:pets_finder/core/helper/values_manger.dart';
import 'package:pets_finder/core/theming/styles.dart';
import 'package:pets_finder/features/animals/domain/entity/details_animal.dart';

class AnimalDetailsCardItem extends StatelessWidget {
  final String title;
  final String value;
  const AnimalDetailsCardItem(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimalDetailsCardItemTitle(
          title: title,
        ),
        AnimalDetailsCardItemValue(
          value: value,
        )
      ],
    );
  }
}

class AnimalDetailsCardItemTitle extends StatelessWidget {
  final String title;

  const AnimalDetailsCardItemTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.font16WhiteSemiBold,
        ),
      ],
    );
  }
}

class AnimalDetailsCardItemValue extends StatelessWidget {
  final String value;

  const AnimalDetailsCardItemValue({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          value,
          style: TextStyles.font16WhiteSemiBold,
        ),
      ],
    );
  }
}

class AnimalDetailsAddressCardItem extends StatelessWidget {
  final AddressDetails addressDetails;
  const AnimalDetailsAddressCardItem({super.key, required this.addressDetails});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              AppString.address,
              style: TextStyles.font16WhiteSemiBold,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              addressDetails.city.isEmpty
                  ? AppString.nullValue
                  : addressDetails.city,
              style: TextStyles.font14LightGrayRegular,
            ),
            horizontalSpace(AppSize.s5),
            Text(
              "/",
              style: TextStyles.font16WhiteSemiBold,
            ),
            horizontalSpace(AppSize.s5),
            Text(
              addressDetails.state.isEmpty
                  ? AppString.nullValue
                  : addressDetails.state,
              style: TextStyles.font14LightGrayRegular,
            ),
            horizontalSpace(AppSize.s5),
            Text(
              "/",
              style: TextStyles.font16WhiteSemiBold,
            ),
            horizontalSpace(AppSize.s5),
            Text(
              addressDetails.country.isEmpty
                  ? AppString.nullValue
                  : addressDetails.country,
              style: TextStyles.font14LightGrayRegular,
            )
          ],
        )
      ],
    );
  }
}
