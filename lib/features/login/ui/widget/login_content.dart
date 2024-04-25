import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_tasks/core/helper/spacing.dart';
import 'package:users_tasks/core/widget/divider.dart';
import 'package:users_tasks/features/login/ui/widget/build_form_field.dart';
import 'package:users_tasks/features/login/ui/widget/build_login_button.dart';
import 'package:users_tasks/features/login/ui/widget/build_sign_with_google.dart';
import 'package:users_tasks/features/login/ui/widget/build_text_login.dart';
import 'package:users_tasks/features/login/ui/widget/login_bloc_listener.dart';
import 'package:users_tasks/features/login/ui/widget/terms_and_conditions.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const BuildTextLogin(),
            verticalSpace(36),
            const BuildSignWithGoogle(),
            verticalSpace(25),
            const DividerOr(),
            verticalSpace(25),
            const BuildFormFieldEmailAndPassword(),
            verticalSpace(24),
            const LoginButton(),
            verticalSpace(16),
            const TermsAndConditionsText(),
            verticalSpace(10),
            const LoginBlocListener(),
          ],
        ),
      ),
    );
  }
}
