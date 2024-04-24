import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pets_finder/core/helper/constances.dart';
import 'package:pets_finder/core/helper/strings_manger.dart';
import 'package:pets_finder/core/theming/color.dart';
import 'package:pets_finder/core/widget/app_bar.dart';
import 'package:pets_finder/features/animals/presentation/controller/cubit/animals_cubit.dart';
import 'package:pets_finder/features/animals/presentation/ui/widget/animals_bloc_listener.dart';
import 'package:pets_finder/features/animals/presentation/ui/widget/animals_content.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});

  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  ScrollController scrollController = ScrollController();
  _bind() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<AnimalsCubit>().emitGetAnimalsState();
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
    return DefaultTabController(
      length: Constances.tabBarFilter.length,
      child: Scaffold(
        appBar: const GeneralAppBar(
          title: Text(AppString.pets),
          leading: SizedBox.shrink(),
        ),
        body: RefreshIndicator(
          onRefresh: () {
            return context.read<AnimalsCubit>().refreshData();
          },
          color: ColorsManager.gray,
          child: ListView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: const [AnimlasContent(), AnimalsBlocListener()],
          ),
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
