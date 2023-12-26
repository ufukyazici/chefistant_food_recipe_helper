import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  late ThemeData theme;
  CustomTheme() {
    theme = ThemeData(
        appBarTheme: const AppBarTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
            backgroundColor: Colors.red,
            centerTitle: true,
            actionsIconTheme: IconThemeData(color: Colors.white),
            iconTheme: IconThemeData(color: Colors.white),
            systemOverlayStyle: SystemUiOverlayStyle.light,
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily);
  }
}
