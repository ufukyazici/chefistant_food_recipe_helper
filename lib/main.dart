import 'package:chefistant_food_recipe_helper/feature/onboard/view/onboard_view.dart';
import 'package:chefistant_food_recipe_helper/product/init/localization_init.dart';
import 'package:chefistant_food_recipe_helper/product/init/theme/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(LocalizationInit(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chefistant',
      home: const OnBoardView(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: CustomTheme().theme,
    );
  }
}
