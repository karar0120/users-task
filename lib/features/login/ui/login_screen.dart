import 'package:flutter/material.dart';
import 'package:users_tasks/core/helper/strings_manger.dart';
import 'package:users_tasks/core/widget/app_bar.dart';
import 'package:users_tasks/features/login/ui/widget/login_content.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: GeneralAppBar(
        title: Text(AppString.login),
        centerTitle: true,
      ),
      body: LoginContent(),
    );
  }
}
