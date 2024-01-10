import 'package:flutter/material.dart';

class MyClickableContainer extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final String text;

  const MyClickableContainer(
      {super.key,
      required this.onTap,
      required this.color,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 20.0),
            Icon(icon),
            const SizedBox(width: 30.0),
            Text(text),
          ],
        ),
      ),
    );
  }
}
