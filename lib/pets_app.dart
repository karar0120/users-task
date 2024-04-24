import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_finder/core/helper/strings_manger.dart';
import 'package:pets_finder/core/helper/values_manger.dart';
import 'package:pets_finder/core/routing/app_router.dart';
import 'package:pets_finder/core/routing/routes.dart';
import 'package:pets_finder/core/theming/theme_data.dart';

class PetsApp extends StatelessWidget {
  const PetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppSize.s375, AppSize.s812),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppString.petsFinderApp,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: Routes.animalsScreen,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
