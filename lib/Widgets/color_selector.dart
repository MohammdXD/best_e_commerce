import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  final List<Color> availableColors;
  final Color? selectedColor;
  final ValueChanged<Color> onColorSelected;

  const ColorSelector({
    super.key,
    required this.availableColors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color? _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.availableColors.map((color) {
        final bool isSelected = _selectedColor == color;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedColor = color;
            });
            widget.onColorSelected(color);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 6),
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              border: Border.all(
                color: isSelected
                    ? const Color(0xfffb7a43) // orange highlight
                    : Colors.transparent,
                width: 2.5,
              ),
              boxShadow: [
                if (isSelected)
                  const BoxShadow(
                    color: Color(0x22FB7A43),
                    blurRadius: 6,
                    spreadRadius: 2,
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
