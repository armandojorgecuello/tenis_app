import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_tennis/ui/utils/colors.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({
    super.key,
    required this.buttomLabel,
    this.onPressed,
    required this.backgroundColor,
    required this.labelColor,
    this.icon,
    this.bordercolor = AppColor.greenButton,
    this.iconString,
  });

  final String buttomLabel;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color labelColor;
  final IconData? icon;
  final String? iconString;
  final Color bordercolor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(backgroundColor),
        shadowColor: WidgetStatePropertyAll<Color>(backgroundColor),
        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            side: BorderSide(color: bordercolor, width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null
              ? Icon(icon, color: labelColor, size: 20.sp)
              : iconString != null
              ? SvgPicture.asset(iconString!, color: labelColor)
              : const SizedBox(),
          (icon != null || iconString != null)
              ? SizedBox(width: 8.w)
              : const SizedBox(),
          Text(
            buttomLabel,
            style: TextStyle(color: labelColor, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
