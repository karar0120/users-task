import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder/core/helper/extensions.dart';
import 'package:pets_finder/core/helper/values_manger.dart';
import 'package:pets_finder/core/routing/routes.dart';
import 'package:pets_finder/core/widget/loader.dart';
import 'package:pets_finder/core/widget/no_record_found.dart';
import 'package:pets_finder/features/animals/presentation/controller/cubit/animals_cubit.dart';
import 'package:pets_finder/features/animals/presentation/ui/widget/animals_card.dart';

class AnimlasList extends StatelessWidget {
  const AnimlasList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalsController = context.read<AnimalsCubit>();
    return Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        color: Colors.transparent,
        child: BlocBuilder<AnimalsCubit, AnimalsState>(
          builder: (context, state) {
            return ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children: List.generate(animalsController.animalsDate.length + 1,
                  (index) {
                if (index < animalsController.animalsDate.length) {
                  return GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.animalsDetailsScreen,
                          arguments: animalsController.animalsDate[index].id);
                    },
                    child: AnimalsCard(
                      animalsData: animalsController.animalsDate[index],
                    ),
                  );
                } else {
                  if (animalsController.isScroll == false &&
                      animalsController.hasMore) {
                    return const SizedBox(
                      height: AppSize.s70,
                      child: LoaderWidget(
                        sizeLoader: 0.05,
                      ),
                    );
                  } else {
                    if (animalsController.animalsDate.isEmpty) {
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
