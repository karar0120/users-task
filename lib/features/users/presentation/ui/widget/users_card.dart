import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_tasks/core/helper/spacing.dart';
import 'package:users_tasks/core/helper/strings_manger.dart';
import 'package:users_tasks/core/helper/values_manger.dart';
import 'package:users_tasks/core/theming/styles.dart';
import 'package:users_tasks/core/widget/image_holder.dart';
import 'package:users_tasks/features/users/domain/entity/users.dart';

class UsersCard extends StatelessWidget {
  final UsersData usersData;
  const UsersCard({super.key, required this.usersData});

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
              imageUrl: usersData.avatar,
            ),
            horizontalSpace(AppSize.s16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppString.firstName,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      horizontalSpace(AppSize.s8),
                      Expanded(
                          child: Text(
                        usersData.firstName.isEmpty
                            ? AppString.nullValue
                            : usersData.firstName,
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
                        AppString.lastName,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      horizontalSpace(AppSize.s8),
                      Expanded(
                          child: Text(
                        usersData.lastName.isEmpty
                            ? AppString.nullValue
                            : usersData.lastName,
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
                        AppString.email,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      horizontalSpace(AppSize.s8),
                      Expanded(
                          child: Text(
                        usersData.email.isEmpty
                            ? AppString.nullValue
                            : usersData.email,
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
