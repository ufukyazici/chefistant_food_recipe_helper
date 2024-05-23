import 'package:flutter/material.dart';

class ProjectDefaultButton extends StatelessWidget {
  const ProjectDefaultButton(
      {super.key, required this.buttonText, required this.isBackgroundWhite, required this.onPressed});
  final String buttonText;
  final bool isBackgroundWhite;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: isBackgroundWhite ? const Color(0xffd52424) : Colors.white,
          foregroundColor: isBackgroundWhite ? Colors.white : const Color(0xffd52424)),
      onPressed: onPressed,
      child: Center(
          child: Text(buttonText, style: TextStyle(color: isBackgroundWhite ? Colors.white : const Color(0xffd52424)))),
    );
  }
}
