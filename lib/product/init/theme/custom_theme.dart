import 'package:chefistant_food_recipe_helper/product/widget/padding/project_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  final colorScheme = _ColorScheme();
  late ThemeData theme;
  CustomTheme() {
    theme = ThemeData(
        textTheme: TextTheme(
          labelSmall: TextStyle(color: colorScheme.textColor),
          labelLarge: TextStyle(color: colorScheme.textColor),
          labelMedium: TextStyle(color: colorScheme.textColor),
        ),
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
                textStyle: MaterialStateProperty.all(const TextStyle(fontWeight: FontWeight.bold)),
                iconColor: MaterialStateProperty.all(colorScheme.secondaryColor),
                foregroundColor: MaterialStateProperty.all(colorScheme.secondaryColor),
                backgroundColor: MaterialStateProperty.all(colorScheme.primaryColor),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colorScheme.primaryColor,
            foregroundColor: colorScheme.secondaryColor,
            shape: const CircleBorder()),
        cardTheme: CardTheme(
            color: colorScheme.secondaryColor,
            margin: const ProjectPadding.smallAll(),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            shadowColor: Colors.black.withOpacity(0.5)),
        listTileTheme: ListTileThemeData(
            textColor: colorScheme.textColor,
            iconColor: colorScheme.textColor,
            titleTextStyle: TextStyle(color: colorScheme.textColor, fontWeight: FontWeight.bold),
            subtitleTextStyle: TextStyle(color: colorScheme.textColor.withOpacity(0.5)),
            tileColor: colorScheme.secondaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            contentPadding: const ProjectPadding.smallAll(),
            horizontalTitleGap: 10,
            minVerticalPadding: 10,
            minLeadingWidth: 10,
            dense: true),
        dividerTheme: const DividerThemeData(indent: 10, thickness: 5),
        checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.all(colorScheme.primaryColor),
            checkColor: MaterialStateProperty.all(colorScheme.secondaryColor),
            side: const BorderSide(color: Colors.transparent)),
        progressIndicatorTheme: const ProgressIndicatorThemeData(circularTrackColor: Colors.white, color: Colors.grey),
        useMaterial3: true,
        fontFamily: GoogleFonts.roboto().fontFamily);
  }
}

class _ColorScheme {
  final Color primaryColor = const Color(0xffd52424);
  final Color secondaryColor = const Color(0xfff0f0f0);
  final Color textColor = const Color(0xff030303);
}
