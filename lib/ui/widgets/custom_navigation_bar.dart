import 'package:flutter/material.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({
    super.key,
    this.onItemTapped,
    this.selectedIndex,
    required this.items,
  });

  final Function(int index)? onItemTapped;
  final int? selectedIndex;
  final List<Map<String, dynamic>> items;

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.items.length, (index) {
          bool isSelected = index == widget.selectedIndex;
          return GestureDetector(
            onTap: () => widget.onItemTapped!(index),
            child: Container(
              width: 90,
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: isSelected ? Colors.green[400] : null,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    widget.items[index]['icon'],
                    color: isSelected ? Colors.white : Colors.black54,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.items[index]['label'],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
