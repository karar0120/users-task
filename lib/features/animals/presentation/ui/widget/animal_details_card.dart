import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_finder/core/helper/launch_url.dart';
import 'package:pets_finder/core/helper/spacing.dart';
import 'package:pets_finder/core/helper/strings_manger.dart';
import 'package:pets_finder/core/helper/values_manger.dart';
import 'package:pets_finder/core/theming/color.dart';
import 'package:pets_finder/core/theming/styles.dart';
import 'package:pets_finder/core/widget/app_text_button.dart';
import 'package:pets_finder/core/widget/image_holder.dart';
import 'package:pets_finder/features/animals/domain/entity/details_animal.dart';
import 'package:pets_finder/features/animals/presentation/ui/widget/animal_details_card_item.dart';

class AnimalDetailsCard extends StatelessWidget {
  final AnimalsDetails animalDetails;
  const AnimalDetailsCard({super.key, required this.animalDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedImage(
          imageUrl: animalDetails.mediumphotos,
          height: AppSize.s300.h,
          width: double.infinity,
        ),
        verticalSpace(AppSize.s20),
        Center(
          child: Text(
            AppString.petsDetails,
            style:
                TextStyles.font24BlackBold.copyWith(color: ColorsManager.dark),
          ),
        ),
        verticalSpace(AppSize.s30),
        AnimalDetailsCardItem(
          title: AppString.name,
          value: animalDetails.name.isEmpty
              ? AppString.nullValue
              : animalDetails.name,
        ),
        verticalSpace(AppSize.s12),
        AnimalDetailsCardItem(
          title: AppString.size,
          value: animalDetails.size.isEmpty
              ? AppString.nullValue
              : animalDetails.size,
        ),
        verticalSpace(AppSize.s12),
        AnimalDetailsCardItem(
          title: AppString.color,
          value: animalDetails.colors!.primary.isEmpty
              ? AppString.nullValue
              : animalDetails.colors!.primary,
        ),
        verticalSpace(AppSize.s12),
        AnimalDetailsAddressCardItem(
          addressDetails: animalDetails.contact!.address!,
        ),
        verticalSpace(AppSize.s50),
        AppTextButton(
            buttonText: AppString.petsWebsite,
            textStyle: TextStyles.font14LightGrayRegular,
            onPressed: () {
              launchLink(animalDetails.url);
            })
      ],
    );
  }
}
