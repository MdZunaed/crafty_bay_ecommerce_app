import 'package:flutter/material.dart';

import '../../utility/app_colors.dart';

class SizeSelector extends StatefulWidget {
  final List sizes;
  final Function(String) onChange;
  const SizeSelector({super.key, required this.sizes, required this.onChange});

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late String selectedSize;
  @override
  void initState() {
    selectedSize = widget.sizes.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.sizes
          .map(
            (s) => InkWell(
              onTap: () {
                selectedSize = s;
                widget.onChange(s);
                setState(() {});
              },
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: selectedSize == s ? AppColors.primaryColor : Colors.black,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: selectedSize == s ? AppColors.primaryColor : Colors.white,
                    child: Text(
                      s,
                      style: TextStyle(fontSize: 13, color: selectedSize == s ? Colors.white : Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
