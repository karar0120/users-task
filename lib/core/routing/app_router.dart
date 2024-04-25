import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_tasks/core/di/dependency_injection.dart';
import 'package:users_tasks/core/helper/constances.dart';
import 'package:users_tasks/core/routing/routes.dart';
import 'package:users_tasks/features/login/logic/cubit/login_cubit.dart';
import 'package:users_tasks/features/login/ui/login_screen.dart';
import 'package:users_tasks/features/users/presentation/controller/cubit/users_cubit.dart';
import 'package:users_tasks/features/users/presentation/ui/screens/users_screens.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        initUsersModule();
        return MaterialPageRoute(
            builder: (context) => BlocProvider<LoginCubit>(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.usersScreen:
        initUsersModule();
        return MaterialPageRoute(
            builder: (context) => BlocProvider<UsersCubit>(
                  create: (context) => getIt<UsersCubit>()..refreshData(),
                  child: const UsersScreen(),
                ));

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(Constances.noRouteFound),
              ),
              body: const Center(child: Text(Constances.noRouteFound)),
            ));
  }
}
