import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_tennis/ui/utils/colors.dart';

class Titles extends StatelessWidget {
  const Titles({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 18.sp, color: AppColor.black),
    );
  }
}
