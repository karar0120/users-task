import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_tasks/core/helper/extensions.dart';
import 'package:users_tasks/core/theming/styles.dart';
import 'package:users_tasks/features/users/presentation/controller/cubit/users_cubit.dart';

class UsersBlocListener extends StatelessWidget {
  const UsersBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersCubit, UsersState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {},
          error: (error) {
            setupErrorState(context, error);
          },
          success: (subject) {
            //context.pop();
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  // context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Center(
        child: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    ),
  );
}
