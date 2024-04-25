import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_tasks/core/helper/strings_manger.dart';
import 'package:users_tasks/core/theming/color.dart';
import 'package:users_tasks/features/users/presentation/controller/cubit/users_cubit.dart';
import 'package:users_tasks/features/users/presentation/ui/widget/users_bloc_listener.dart';
import 'package:users_tasks/features/users/presentation/ui/widget/users_content.dart';

import '../../../../../core/widget/app_bar.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  ScrollController scrollController = ScrollController();
  _bind() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<UsersCubit>().emitGetUsersState();
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(
        title: Text(AppString.users),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return context.read<UsersCubit>().refreshData();
        },
        color: ColorsManager.gray,
        child: ListView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: const [UsersContent(), UsersBlocListener()],
        ),
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
