import 'package:flutter/material.dart';
import 'package:users_tasks/core/helper/strings_manger.dart';
import 'package:users_tasks/core/helper/values_manger.dart';
import 'package:users_tasks/core/theming/styles.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(
                left: AppPadding.p10, right: AppPadding.p15),
            child: const Divider(color: Colors.white)),
      ),
      Text(
        AppString.or,
        style: TextStyles.font24BlueBold.copyWith(color: Colors.white),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(
                left: AppPadding.p15, right: AppPadding.p10),
            child: const Divider(
              color: Colors.white,
            )),
      ),
    ]);
  }
}
