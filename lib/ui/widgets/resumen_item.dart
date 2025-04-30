import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ResumeItem extends StatelessWidget {
  const ResumeItem({
    super.key,
    required this.titleOne,
    required this.titleTwo,
    required this.iconOne,
    required this.iconTwo,
  });

  final String titleOne;
  final String titleTwo;
  final String iconOne;
  final String iconTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(iconOne),
            SizedBox(width: 4.w),
            Text(
              titleOne,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        SizedBox(height: 8.w),
        Row(
          children: [
            SvgPicture.asset(iconTwo),
            SizedBox(width: 4.w),
            Text(
              titleTwo,
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
