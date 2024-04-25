import 'package:flutter/material.dart';
import 'package:users_tasks/core/helper/spacing.dart';
import 'package:users_tasks/core/helper/values_manger.dart';
import 'package:users_tasks/features/users/presentation/ui/widget/users_list_view.dart';

class UsersContent extends StatelessWidget {
  const UsersContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        children: [verticalSpace(AppSize.s5), const UsersList()],
      ),
    );
  }
}
