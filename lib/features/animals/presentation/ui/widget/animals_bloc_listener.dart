import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder/core/helper/extensions.dart';
import 'package:pets_finder/core/theming/styles.dart';
import 'package:pets_finder/features/animals/presentation/controller/cubit/animals_cubit.dart';

class AnimalsBlocListener extends StatelessWidget {
  const AnimalsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AnimalsCubit, AnimalsState>(
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
