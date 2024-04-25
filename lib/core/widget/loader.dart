import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:users_tasks/core/theming/color.dart';

class LoaderWidget extends StatelessWidget {
  final double sizeLoader;
  const LoaderWidget({super.key, required this.sizeLoader});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: ColorsManager.moreLightGray,
        size: sizeLoader.sw,
      ),
    );
  }
}
