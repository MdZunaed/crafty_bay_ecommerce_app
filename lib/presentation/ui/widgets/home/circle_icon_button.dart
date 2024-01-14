import 'package:flutter/material.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CircleIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: CircleAvatar(
            radius: 18, backgroundColor: Colors.grey.shade200, child: Icon(icon, color: Colors.black54)),
      ),
    );
  }
}
