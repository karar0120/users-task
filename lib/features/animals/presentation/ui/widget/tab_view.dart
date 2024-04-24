import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_finder/core/helper/constances.dart';
import 'package:pets_finder/core/helper/values_manger.dart';
import 'package:pets_finder/core/theming/color.dart';
import 'package:pets_finder/core/theming/styles.dart';
import 'package:pets_finder/features/animals/presentation/controller/cubit/animals_cubit.dart';

class TapBarViews extends StatelessWidget {
  const TapBarViews({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
        physics: const BouncingScrollPhysics(),
        indicator: BoxDecoration(
          color: ColorsManager.yallow,
          borderRadius: BorderRadius.circular(AppSize.s8.r),
        ),
        unselectedLabelColor: ColorsManager.moreLightGray,
        unselectedLabelStyle: TextStyles.font14LightGrayRegular,
        labelStyle: TextStyles.font14LightGrayRegular,
        onTap: (int index) {
          context
              .read<AnimalsCubit>()
              .setSelectedFilterAnimals(Constances.tabBarFilter[index]);
        },
        isScrollable: true,
        tabs: List.generate(Constances.tabBarFilter.length, (index) {
          return SizedBox(
            width: AppSize.s60.w,
            height: AppSize.s45.h,
            child: Tab(
              child: Text(Constances.tabBarFilter[index].name),
            ),
          );
        }));
  }
}
