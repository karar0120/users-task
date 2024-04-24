import 'package:flutter/material.dart';
import 'package:pets_finder/core/helper/spacing.dart';
import 'package:pets_finder/core/helper/values_manger.dart';
import 'package:pets_finder/features/animals/presentation/ui/widget/animals_list_view.dart';
import 'package:pets_finder/features/animals/presentation/ui/widget/tab_view.dart';

class AnimlasContent extends StatelessWidget {
  const AnimlasContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p12),
      child: Column(
        children: [
          verticalSpace(AppSize.s5),
          const TapBarViews(),
          const AnimlasList()
        ],
      ),
    );
  }
}
