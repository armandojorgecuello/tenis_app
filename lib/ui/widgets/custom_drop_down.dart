import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:app_tennis/gen/assets.gen.dart';
import 'package:app_tennis/ui/utils/colors.dart';

class CustomDropdown extends StatefulWidget {
  final Function(String?) onSelected;
  final String labelText;
  final DateTime? initialDate;
  final List<String> items;

  const CustomDropdown({
    super.key,
    required this.onSelected,
    required this.items,
    this.labelText = '',
    this.initialDate,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String itemSelected = 'Jorge Cuello';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.black),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: itemSelected,
          hint: Text(widget.labelText),
          onChanged: (value) {
            setState(() {
              itemSelected = value!;
            });
            widget.onSelected(value);
          },
          items:
              widget.items
                  .map(
                    (e) => DropdownMenuItem<String>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text(e)],
                      ),
                    ),
                  )
                  .toList(),
          icon: SvgPicture.asset(MyAssets.images.arrowDown),
        ),
      ),
    );
  }
}
