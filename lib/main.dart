import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:users_tasks/core/di/dependency_injection.dart';
import 'package:users_tasks/firebase_options.dart';
import 'package:users_tasks/users_app.dart';

void main() async {
// To fix texts being hidden bug in flutter_screenutil in release mode.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(const UsersApp());
}
