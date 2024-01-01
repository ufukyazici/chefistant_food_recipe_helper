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
          backgroundColor: isBackgroundWhite ? Colors.red : Colors.white,
          foregroundColor: isBackgroundWhite ? Colors.white : Colors.red),
      onPressed: onPressed,
      child: Center(child: Text(buttonText, style: TextStyle(color: isBackgroundWhite ? Colors.white : Colors.red))),
    );
  }
}
