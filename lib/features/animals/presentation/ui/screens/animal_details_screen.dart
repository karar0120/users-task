import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder/core/helper/strings_manger.dart';
import 'package:pets_finder/core/widget/app_bar.dart';
import 'package:pets_finder/core/widget/loader.dart';
import 'package:pets_finder/features/animals/presentation/ui/widget/animal_details_content.dart';
import 'package:pets_finder/features/animals/presentation/ui/widget/animals_bloc_listener.dart';

import '../../controller/animal_details_cubit/cubit/animal_details_cubit.dart';

class AnimalDetailsScreen extends StatelessWidget {
  const AnimalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimalDetailsCubit, AnimalDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const GeneralAppBar(
            title: Text(AppString.petsDetails),
          ),
          body: state.whenOrNull(initial: () {
            return null;
          }, success: (animalDetails) {
            return AnimalDetailsContent(animalsDetails: animalDetails);
          }, error: (error) {
            setupErrorState(context, error);
            return null;
          }, loading: () {
            return const LoaderWidget(sizeLoader: 0.05);
          }),
        );
      },
    );
  }
}
