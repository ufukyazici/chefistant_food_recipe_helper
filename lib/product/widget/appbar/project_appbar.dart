import 'package:flutter/material.dart';

AppBar projectAppbar({String title = "Chefistant", List<Widget>? actions, Widget? leading}) {
  return AppBar(
    title: Text(title),
    actions: actions,
    leading: leading,
  );
}
