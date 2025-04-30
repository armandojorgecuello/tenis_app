import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:app_tennis/ui/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,

    required this.controller,
    this.title,
    this.labelString = '',
    this.textCapitalization,
    this.decoration,
    this.initialValue,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.style,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.autocorrect = false,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled,
    this.icon,
    this.sufixIcon,
  });

  final TextCapitalization? textCapitalization;
  final InputDecoration? decoration;
  final TextEditingController controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final Function(String)? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final Function(String?)? onSaved;
  final String Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final String? title;
  final String labelString;
  final IconData? icon;
  final Widget? sufixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Visibility(
        //   visible: title != null,
        //   child: Text(
        //     title ?? '',
        //     style: TextStyle(color: AppColor.labelColor, fontSize: 12.sp),
        //   ),
        // ),
        TextFormField(
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          decoration: InputDecoration(
            hintText: labelString,
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            suffixIcon: sufixIcon,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon != null
                    ? Icon(icon, color: AppColor.textcolor)
                    : const SizedBox(),
                const SizedBox(width: 10),
                SizedBox(
                  height: 25.h,
                  child: const VerticalDivider(color: AppColor.textcolor),
                ),
                Text(title ?? labelString, style: TextStyle(fontSize: 14.sp)),
              ],
            ),
            labelStyle: const TextStyle(color: AppColor.textcolor),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColor.black),
            ),
          ),
          controller: controller,
          initialValue: initialValue,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          style: style,
          strutStyle: strutStyle,
          textDirection: textDirection,
          textAlign: textAlign,
          textAlignVertical: textAlignVertical,
          autofocus: autofocus,
          readOnly: readOnly,
          obscuringCharacter: obscuringCharacter,
          obscureText: obscureText,
          autocorrect: autocorrect,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          onChanged: onChanged,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          validator: validator,
          inputFormatters: inputFormatters,
          enabled: enabled,
        ),
      ],
    );
  }
}
