import 'package:chefistant_food_recipe_helper/product/widget/padding/project_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  final colorScheme = _ColorScheme();
  late ThemeData theme;
  CustomTheme() {
    theme = ThemeData(
        appBarTheme: AppBarTheme(
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
            backgroundColor: colorScheme.primaryColor,
            centerTitle: true,
            actionsIconTheme: const IconThemeData(color: Colors.white),
            iconTheme: IconThemeData(color: colorScheme.secondaryColor),
            systemOverlayStyle: SystemUiOverlayStyle.light,
            titleTextStyle: TextStyle(color: colorScheme.secondaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                iconColor: MaterialStateProperty.all(colorScheme.secondaryColor),
                foregroundColor: MaterialStateProperty.all(colorScheme.secondaryColor),
                backgroundColor: MaterialStateProperty.all(colorScheme.primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colorScheme.primaryColor,
            foregroundColor: colorScheme.secondaryColor,
            shape: const CircleBorder()),
        cardTheme: CardTheme(
            color: colorScheme.primaryColor,
            margin: const ProjectPadding.smallAll(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            shadowColor: Colors.black.withOpacity(0.5)),
        listTileTheme: ListTileThemeData(
            textColor: colorScheme.secondaryColor,
            iconColor: colorScheme.secondaryColor,
            titleTextStyle: TextStyle(color: colorScheme.secondaryColor, fontWeight: FontWeight.bold),
            subtitleTextStyle: TextStyle(color: colorScheme.secondaryColor.withOpacity(0.5)),
            tileColor: colorScheme.primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding: const ProjectPadding.smallAll(),
            horizontalTitleGap: 10,
            minVerticalPadding: 10,
            minLeadingWidth: 10,
            dense: true),
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily);
  }
}

class _ColorScheme {
  final Color primaryColor = Colors.red;
  final Color secondaryColor = Colors.white;
}
