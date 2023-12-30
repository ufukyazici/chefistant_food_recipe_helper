import 'package:flutter/material.dart';

AppBar projectAppbar({required String title, List<Widget>? actions, Widget? leading}) {
  return AppBar(
    title: Text(title),
    actions: actions,
    leading: leading,
  );
}
