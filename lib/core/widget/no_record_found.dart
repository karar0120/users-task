import 'package:flutter/material.dart';
import 'package:users_tasks/core/helper/constances.dart';
import 'package:users_tasks/core/helper/values_manger.dart';

class NoRecoredsFound extends StatelessWidget {
  const NoRecoredsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: AppSize.s70,
        child: Center(child: Text(Constances.noRecoredsFound)));
  }
}
