import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_tasks/core/helper/strings_manger.dart';
import 'package:users_tasks/core/helper/values_manger.dart';
import 'package:users_tasks/core/routing/app_router.dart';
import 'package:users_tasks/core/routing/routes.dart';
import 'package:users_tasks/core/theming/theme_data.dart';

class UsersApp extends StatelessWidget {
  const UsersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(AppSize.s375, AppSize.s812),
      minTextAdapt: true,
      child: MaterialApp(
        title: AppString.users,
        debugShowCheckedModeBanner: false,
        theme: themeData,
        initialRoute: Routes.loginScreen,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
