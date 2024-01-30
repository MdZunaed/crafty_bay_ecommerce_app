import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  final List colors;
  final Function(Color) onChange;
  const ColorSelector({super.key, required this.colors, required this.onChange});

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color selectedColor;
  @override
  void initState() {
    selectedColor = widget.colors.first;
    widget.onChange(selectedColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors
          .map(
            (c) => InkWell(
              onTap: () {
                selectedColor = c;
                widget.onChange(c);
                setState(() {});
              },
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: c,
                  child: selectedColor == c ? const Icon(Icons.done, color: Colors.white) : null,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
