import 'package:flutter/material.dart';
import 'package:pets_finder/core/helper/extensions.dart';
import 'package:pets_finder/core/helper/values_manger.dart';
import 'package:pets_finder/core/theming/styles.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final double? leadingWidth;
  final bool? centerTitle;
  final double? padding;
  final Color? appBarColor;
  final Widget? leading;
  final List<Widget>? actions;
  final double? elevation;
  final double? appbarPreferredSize;
  final Color? appbarBackButtonColor;

  const GeneralAppBar(
      {Key? key,
      this.title,
      this.leadingWidth,
      this.centerTitle,
      this.appBarColor,
      this.leading,
      this.actions,
      this.appbarPreferredSize = AppSize.s80,
      this.elevation = 0.0,
      this.padding = 0.0,
      this.appbarBackButtonColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: leadingWidth,
        centerTitle: centerTitle ?? true,
        title: title,
        titleTextStyle: TextStyles.font16WhiteMedium,
        elevation: elevation,
        leading: leading ??
            InkWell(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: appbarBackButtonColor,
                  size: 18,
                )),
        actions: actions,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(AppSize.s25),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(appbarPreferredSize ?? kToolbarHeight);
}
