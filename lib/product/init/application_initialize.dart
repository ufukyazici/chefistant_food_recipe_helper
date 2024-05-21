import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:chefistant_food_recipe_helper/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final class ApplicationInitialize {
  /// project basic required initialize
  Future<void> make() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initialize();
  }

  /// This method is used to initialize the application process
  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Alarm.init();
    // Depedency initialize
    // envied
  }
}
