import 'package:chefistant_food_recipe_helper/product/utility/constants/enums/locales.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocalizationInit extends EasyLocalization {
  LocalizationInit({required super.child, super.key})
      : super(supportedLocales: _supportedItems, path: _translationsPath, useOnlyLangCode: true);

  static final List<Locale> _supportedItems = [Locales.tr.locale, Locales.en.locale];

  static const String _translationsPath = 'assets/translations';

  static void updateLanguage({required BuildContext context, required Locales value}) {
    context.setLocale(value.locale);
  }
}
