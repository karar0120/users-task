import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_tasks/core/helper/values_manger.dart';
import 'package:users_tasks/core/widget/loader.dart';
import 'package:users_tasks/core/widget/no_record_found.dart';
import 'package:users_tasks/features/users/presentation/controller/cubit/users_cubit.dart';
import 'package:users_tasks/features/users/presentation/ui/widget/users_card.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usersController = context.read<UsersCubit>();
    return Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        color: Colors.transparent,
        child: BlocBuilder<UsersCubit, UsersState>(
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: List.generate(usersController.animalsDate.length + 1,
                  (index) {
                if (index < usersController.animalsDate.length) {
                  return GestureDetector(
                    onTap: () {},
                    child: UsersCard(
                      usersData: usersController.animalsDate[index],
                    ),
                  );
                } else {
                  if (usersController.isScroll == false &&
                      usersController.hasMore) {
                    return const SizedBox(
                      height: AppSize.s70,
                      child: LoaderWidget(
                        sizeLoader: 0.05,
                      ),
                    );
                  } else {
                    if (usersController.animalsDate.isEmpty) {
                      return const NoRecoredsFound();
                    } else {
                      return const SizedBox();
                    }
                  }
                }
              }),
            );
          },
        ));
  }
}
