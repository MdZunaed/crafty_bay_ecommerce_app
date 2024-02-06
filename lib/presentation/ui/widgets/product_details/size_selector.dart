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
    widget.onChange(selectedSize);
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
              borderRadius: BorderRadius.circular(30),
              child: Container(
                height: 35,
                width: 35,
                margin: const EdgeInsets.all(5),
                //padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: selectedSize == s ? AppColors.primaryColor : Colors.white,
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: selectedSize == s ? AppColors.primaryColor : Colors.black)),
                child: Center(
                    child: Text(s, style: TextStyle(color: selectedSize == s ? Colors.white : Colors.black))),
              ),
            ),
          )
          .toList(),
    );
  }
}
