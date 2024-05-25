import 'package:chefistant_food_recipe_helper/feature/navbar/view/navbar_view.dart';
import 'package:chefistant_food_recipe_helper/product/init/application_initialize.dart';
import 'package:chefistant_food_recipe_helper/product/init/localization_init.dart';
import 'package:chefistant_food_recipe_helper/product/init/theme/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await ApplicationInitialize().make();
  runApp(LocalizationInit(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chefistant',
      home: const NavbarView(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomTheme().theme,
    );
  }
}
