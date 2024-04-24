import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_finder/core/helper/spacing.dart';
import 'package:pets_finder/core/helper/values_manger.dart';
import 'package:pets_finder/features/animals/domain/entity/details_animal.dart';
import 'package:pets_finder/features/animals/presentation/ui/widget/animal_details_card.dart';

class AnimalDetailsContent extends StatelessWidget {
  final AnimalsDetails animalsDetails;
  const AnimalDetailsContent({super.key, required this.animalsDetails});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: AppPadding.p8.h, horizontal: AppPadding.p14.w),
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          verticalSpace(AppSize.s25),
          AnimalDetailsCard(animalDetails: animalsDetails),
        ],
      ),
    );
  }
}
