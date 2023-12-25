import 'package:flutter/material.dart';

enum Locales {
  //TR Locale
  tr(Locale('tr', 'TR')),
  //Eng Locale
  en(Locale('en', 'US'));

  final Locale locale;

  const Locales(this.locale);
}
