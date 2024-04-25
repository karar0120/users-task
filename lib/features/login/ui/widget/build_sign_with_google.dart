import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_tasks/core/helper/spacing.dart';
import 'package:users_tasks/core/helper/strings_manger.dart';
import 'package:users_tasks/core/helper/values_manger.dart';
import 'package:users_tasks/core/theming/color.dart';
import 'package:users_tasks/core/theming/styles.dart';
import 'package:users_tasks/features/login/logic/cubit/login_cubit.dart';

class BuildSignWithGoogle extends StatelessWidget {
  const BuildSignWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        validateThenDoLogin(context);
      },
      child: Container(
        width: double.infinity,
        height: AppSize.s60.h,
        padding: const EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppSize.s25),
        ),
        child: Row(
          children: [
            CircleAvatar(
                radius: AppSize.s20.r,
                backgroundColor: ColorsManager.moreLightGray,
                child: Image.asset('assets/images/google_icons.webp')),
            horizontalSpace(10),
            Text(
              AppString.signInWithGoogle,
              style: TextStyles.font24BlueBold.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginWithGoogleState();
    }
  }
}
