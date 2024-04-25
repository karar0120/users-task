import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:users_tasks/core/helper/image_manger.dart';
import 'package:users_tasks/core/helper/values_manger.dart';
import 'package:users_tasks/core/theming/color.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const CachedImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    if (imageUrl.isEmpty) {
      return SizedBox(
        height: height ?? AppSize.s100.h,
        width: width ?? AppSize.s90.w,
        child: SvgPicture.asset(
          ImageManger.imagePlaceHolder,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(AppSize.s4),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: height ?? AppSize.s100.h,
          fit: BoxFit.cover,
          width: width ?? AppSize.s90.w,
          placeholder: (context, url) => Center(
            child: LoadingAnimationWidget.discreteCircle(
                color: ColorsManager.moreLightGray,
                size: AppSize.s30,
                secondRingColor: Colors.transparent,
                thirdRingColor: Colors.transparent),
          ),
          errorWidget: (context, url, error) => Container(
            width: media.width * 0.4,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color:  whiteColor
            ),
            child: SvgPicture.asset(ImageManger.imagePlaceHolder),
          ),
        ),
      );
    }
  }
}
