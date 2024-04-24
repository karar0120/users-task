import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pets_finder/core/di/dependency_injection.dart';
import 'package:pets_finder/pets_app.dart';

void main() async {
// To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(const PetsApp());
}
