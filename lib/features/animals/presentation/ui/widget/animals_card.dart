import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_finder/core/helper/spacing.dart';
import 'package:pets_finder/core/helper/strings_manger.dart';
import 'package:pets_finder/core/helper/values_manger.dart';
import 'package:pets_finder/core/theming/styles.dart';
import 'package:pets_finder/core/widget/image_holder.dart';
import 'package:pets_finder/features/animals/domain/entity/animals.dart';

class AnimalsCard extends StatelessWidget {
  final AnimalsData animalsData;
  const AnimalsCard({super.key, required this.animalsData});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(AppMargin.m8),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.p16.h, horizontal: AppPadding.p16.w),
        child: Row(
          children: [
            CachedImage(
              imageUrl: animalsData.smallPhoto,
            ),
            horizontalSpace(AppSize.s16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppString.name,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      horizontalSpace(AppSize.s8),
                      Expanded(
                          child: Text(
                        animalsData.name.isEmpty
                            ? AppString.nullValue
                            : animalsData.name,
                        style: TextStyles.font14LightGrayRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  verticalSpace(AppSize.s12),
                  Row(
                    children: [
                      Text(
                        AppString.gender,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      horizontalSpace(AppSize.s8),
                      Expanded(
                          child: Text(
                        animalsData.gender.isEmpty
                            ? AppString.nullValue
                            : animalsData.gender,
                        style: TextStyles.font14LightGrayRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  verticalSpace(AppSize.s12),
                  Row(
                    children: [
                      Text(
                        AppString.type,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      horizontalSpace(AppSize.s8),
                      Expanded(
                          child: Text(
                        animalsData.type.isEmpty
                            ? AppString.nullValue
                            : animalsData.type,
                        style: TextStyles.font14LightGrayRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
