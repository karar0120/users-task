import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_tasks/core/helper/spacing.dart';
import 'package:users_tasks/core/theming/color.dart';
import '../../../../core/theming/styles.dart';

class BuildTextLogin extends StatelessWidget {
  const BuildTextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Text(
          "Welcome Back",
          style: TextStyles.font24BlueBold.copyWith(color: Colors.white),
        ),
        verticalSpace(8),
        Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: TextStyles.font14GrayRegular
              .copyWith(color: ColorsManager.lighterGray),
        )
      ],
    );
  }
}
